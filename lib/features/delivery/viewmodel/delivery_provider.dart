import 'dart:async';

import 'package:postman/core/providers/core_providers.dart';
import 'package:postman/features/auth/viewmodel/auth_provider.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';
import 'package:postman/features/delivery/model/delivery_list.dart';
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:postman/features/delivery/model/status_update.dart';
import 'package:postman/features/delivery/repository/delivery_repository.dart';
import 'package:postman/features/delivery/repository/delivery_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delivery_provider.g.dart';

/// Provides the DeliveryRepository instance
@Riverpod(keepAlive: true)
DeliveryRepository deliveryRepository(DeliveryRepositoryRef ref) {
  return DeliveryRepositoryImpl(
    apiClient: ref.watch(apiClientProvider),
    connectionChecker: ref.watch(connectionCheckerProvider),
  );
}

/// Delivery list state with filter support
class DeliveryListState {
  final DeliveryList? deliveryList;
  final DeliveryStatusFilter filter;
  final bool isLoading;
  final String? errorMessage;
  final bool isRouteActive;

  const DeliveryListState({
    this.deliveryList,
    this.filter = DeliveryStatusFilter.all,
    this.isLoading = false,
    this.errorMessage,
    this.isRouteActive = false,
  });

  DeliveryListState copyWith({
    DeliveryList? deliveryList,
    DeliveryStatusFilter? filter,
    bool? isLoading,
    String? errorMessage,
    bool? isRouteActive,
  }) {
    return DeliveryListState(
      deliveryList: deliveryList ?? this.deliveryList,
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRouteActive: isRouteActive ?? this.isRouteActive,
    );
  }

  /// Get filtered parcels based on current filter
  List<Parcel> get filteredParcels {
    if (deliveryList == null) return [];

    switch (filter) {
      case DeliveryStatusFilter.all:
        return deliveryList!.parcels;
      case DeliveryStatusFilter.pending:
        return deliveryList!.parcels
            .where(
              (p) =>
                  p.status == DeliveryStatus.pending ||
                  p.status == DeliveryStatus.outForDelivery,
            )
            .toList();
      case DeliveryStatusFilter.delivered:
        return deliveryList!.parcels
            .where((p) => p.status == DeliveryStatus.delivered)
            .toList();
      case DeliveryStatusFilter.failed:
        return deliveryList!.parcels
            .where((p) => p.status == DeliveryStatus.failed)
            .toList();
    }
  }

  /// Count for each filter tab
  int countForFilter(DeliveryStatusFilter f) {
    if (deliveryList == null) return 0;

    switch (f) {
      case DeliveryStatusFilter.all:
        return deliveryList!.totalParcels;
      case DeliveryStatusFilter.pending:
        return deliveryList!.pendingCount + deliveryList!.outForDeliveryCount;
      case DeliveryStatusFilter.delivered:
        return deliveryList!.deliveredCount;
      case DeliveryStatusFilter.failed:
        return deliveryList!.failedCount;
    }
  }
}

/// Filter options for delivery list
enum DeliveryStatusFilter { all, pending, delivered, failed }

/// Main ViewModel for delivery list operations
@riverpod
class DeliveryNotifier extends _$DeliveryNotifier {
  late final DeliveryRepository _repository;
  String? _postmanId;

  @override
  DeliveryListState build() {
    _repository = ref.read(deliveryRepositoryProvider);

    // Get postman ID from auth state
    final authState = ref.watch(authNotifierProvider);
    if (authState is AuthStateAuthenticated) {
      _postmanId = authState.user.id;
      // Auto-load deliveries when authenticated
      Future.microtask(() => loadDeliveries());
    }

    return const DeliveryListState(isLoading: true);
  }

  /// Load/refresh deliveries for today
  Future<void> loadDeliveries({DateTime? date}) async {
    if (_postmanId == null) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Not authenticated',
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.getDeliveries(
      postmanId: _postmanId!,
      deliveryDate: date,
    );

    result.match(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (deliveryList) {
        // Check if any parcel is out for delivery (route is active)
        final hasActiveDelivery = deliveryList.parcels.any(
          (p) => p.status == DeliveryStatus.outForDelivery,
        );

        state = state.copyWith(
          deliveryList: deliveryList,
          isLoading: false,
          isRouteActive: hasActiveDelivery,
        );
      },
    );
  }

  /// Change the filter
  void setFilter(DeliveryStatusFilter filter) {
    state = state.copyWith(filter: filter);
  }

  /// Update a parcel's status
  Future<bool> updateParcelStatus({
    required String parcelId,
    required StatusUpdateRequest request,
  }) async {
    final result = await _repository.updateParcelStatus(
      parcelId: parcelId,
      request: request,
    );

    return result.match((failure) => false, (response) {
      // Refresh the list to get updated data
      loadDeliveries();
      return true;
    });
  }

  /// Mark a parcel as out for delivery
  Future<bool> markOutForDelivery(
    String parcelId, {
    double? lat,
    double? lng,
  }) async {
    return updateParcelStatus(
      parcelId: parcelId,
      request: StatusUpdateRequest.outForDelivery(lat: lat, lng: lng),
    );
  }

  /// Mark a parcel as failed
  Future<bool> markFailed(
    String parcelId, {
    required FailureReason reason,
    String? notes,
    double? lat,
    double? lng,
  }) async {
    return updateParcelStatus(
      parcelId: parcelId,
      request: StatusUpdateRequest.failed(
        reason: reason,
        notes: notes,
        lat: lat,
        lng: lng,
      ),
    );
  }

  /// Start the delivery route (mark all pending as out for delivery)
  Future<int> startRoute({double? lat, double? lng}) async {
    if (_postmanId == null || state.deliveryList == null) return 0;

    final pendingParcels = state.deliveryList!.parcels
        .where((p) => p.status == DeliveryStatus.pending)
        .map((p) => p.id)
        .toList();

    if (pendingParcels.isEmpty) return 0;

    final result = await _repository.startDeliveryRoute(
      postmanId: _postmanId!,
      parcelIds: pendingParcels,
      lat: lat,
      lng: lng,
    );

    return result.match((failure) => 0, (count) {
      loadDeliveries();
      return count;
    });
  }

  /// Get a specific parcel by ID
  Parcel? getParcel(String parcelId) {
    return state.deliveryList?.parcels
        .where((p) => p.id == parcelId)
        .firstOrNull;
  }
}
