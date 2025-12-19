import 'package:fpdart/fpdart.dart';
import 'package:postman/core/constants/api_endpoints.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/core/network/api_client.dart';
import 'package:postman/core/network/connection_checker.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';
import 'package:postman/features/delivery/model/delivery_list.dart';
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:postman/features/delivery/model/status_update.dart';
import 'package:postman/features/delivery/repository/delivery_repository.dart';

/// Implementation of [DeliveryRepository] that handles remote API calls
class DeliveryRepositoryImpl implements DeliveryRepository {
  final ApiClient _apiClient;
  final ConnectionChecker _connectionChecker;

  // Local cache for quick parcel lookup
  final Map<String, Parcel> _parcelCache = {};

  DeliveryRepositoryImpl({
    required ApiClient apiClient,
    required ConnectionChecker connectionChecker,
  }) : _apiClient = apiClient,
       _connectionChecker = connectionChecker;

  @override
  Future<Either<Failure, DeliveryList>> getDeliveries({
    required String postmanId,
    DateTime? deliveryDate,
  }) async {
    if (!await _connectionChecker.isConnected) {
      return left(const Failure.network());
    }

    final queryParams = <String, String>{};
    if (deliveryDate != null) {
      queryParams['delivery_date'] =
          '${deliveryDate.year}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}';
    }

    final result = await _apiClient.get<DeliveryList>(
      ApiEndpoints.deliveries(postmanId),
      fromJson: DeliveryList.fromJson,
      queryParams: queryParams.isNotEmpty ? queryParams : null,
    );

    // Cache parcels for quick lookup
    result.match((failure) => null, (deliveryList) {
      for (final parcel in deliveryList.parcels) {
        _parcelCache[parcel.id] = parcel;
      }
    });

    return result;
  }

  @override
  Future<Either<Failure, StatusUpdateResponse>> updateParcelStatus({
    required String parcelId,
    required StatusUpdateRequest request,
  }) async {
    if (!await _connectionChecker.isConnected) {
      return left(const Failure.network());
    }

    final result = await _apiClient.post<StatusUpdateResponse>(
      ApiEndpoints.parcelStatus(parcelId),
      fromJson: StatusUpdateResponse.fromJson,
      body: request.toJson(),
    );

    // Update local cache on success
    result.match((failure) => null, (response) {
      final cached = _parcelCache[parcelId];
      if (cached != null) {
        _parcelCache[parcelId] = cached.copyWith(
          status: DeliveryStatus.fromString(response.newStatus),
        );
      }
    });

    return result;
  }

  @override
  Future<Either<Failure, Parcel>> getParcel(String parcelId) async {
    // Check cache first
    final cached = _parcelCache[parcelId];
    if (cached != null) {
      return right(cached);
    }

    // If not in cache, we'd need a dedicated endpoint
    // For now, return an error as the API doesn't have a single parcel endpoint
    return left(const Failure.cache(message: 'Parcel not found in cache'));
  }

  @override
  Future<Either<Failure, int>> startDeliveryRoute({
    required String postmanId,
    required List<String> parcelIds,
    double? lat,
    double? lng,
  }) async {
    if (!await _connectionChecker.isConnected) {
      return left(const Failure.network());
    }

    int successCount = 0;

    // Update each parcel to OUT_FOR_DELIVERY
    for (final parcelId in parcelIds) {
      final request = StatusUpdateRequest.outForDelivery(lat: lat, lng: lng);

      final result = await updateParcelStatus(
        parcelId: parcelId,
        request: request,
      );

      result.match((failure) => null, (response) => successCount++);
    }

    return right(successCount);
  }

  /// Clear the local cache
  void clearCache() {
    _parcelCache.clear();
  }
}
