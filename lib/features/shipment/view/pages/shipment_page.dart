import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:postman/features/delivery/viewmodel/delivery_provider.dart';

part '../widgets/shipment_widgets.dart';

// =========================
// Filter Enum
// =========================

enum ShipmentFilter { all, outForDelivery, delivered, failed }

extension ShipmentFilterX on ShipmentFilter {
  String get label {
    switch (this) {
      case ShipmentFilter.all:
        return 'All';
      case ShipmentFilter.outForDelivery:
        return 'In Delivery';
      case ShipmentFilter.delivered:
        return 'Delivered';
      case ShipmentFilter.failed:
        return 'Failed';
    }
  }

  /// Convert to DeliveryStatus for filtering
  DeliveryStatus? get toDeliveryStatus {
    switch (this) {
      case ShipmentFilter.all:
        return null;
      case ShipmentFilter.outForDelivery:
        return DeliveryStatus.outForDelivery;
      case ShipmentFilter.delivered:
        return DeliveryStatus.delivered;
      case ShipmentFilter.failed:
        return DeliveryStatus.failed;
    }
  }
}

// =========================
// View
// =========================

class ShipmentPage extends ConsumerStatefulWidget {
  const ShipmentPage({super.key});

  @override
  ConsumerState<ShipmentPage> createState() => _ShipmentPageState();
}

class _ShipmentPageState extends ConsumerState<ShipmentPage> {
  ShipmentFilter _selectedFilter = ShipmentFilter.all;

  List<Parcel> _filterParcels(List<Parcel> parcels) {
    if (_selectedFilter == ShipmentFilter.all) {
      return parcels;
    }

    final status = _selectedFilter.toDeliveryStatus;
    if (status == null) return parcels;

    // For "In Delivery", include both pending and out_for_delivery
    if (_selectedFilter == ShipmentFilter.outForDelivery) {
      return parcels
          .where(
            (p) =>
                p.status == DeliveryStatus.pending ||
                p.status == DeliveryStatus.outForDelivery,
          )
          .toList();
    }

    return parcels.where((p) => p.status == status).toList();
  }

  void _onFilterSelected(ShipmentFilter filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final deliveryState = ref.watch(deliveryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shipments',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _RoundIconButton(
              icon: Icons.refresh_rounded,
              onTap: () {
                ref.read(deliveryNotifierProvider.notifier).loadDeliveries();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShipmentFilterChips(
              selected: _selectedFilter,
              onSelected: _onFilterSelected,
            ),
            const SizedBox(height: 18),
            Expanded(child: _buildContent(deliveryState, colorScheme)),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(DeliveryListState state, ColorScheme colorScheme) {
    if (state.isLoading && state.deliveryList == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.deliveryList == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: colorScheme.error),
            const SizedBox(height: 16),
            Text(state.errorMessage!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(deliveryNotifierProvider.notifier).loadDeliveries();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final parcels = state.deliveryList?.parcels ?? [];
    final filteredParcels = _filterParcels(parcels);

    if (filteredParcels.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No shipments found',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(deliveryNotifierProvider.notifier).loadDeliveries();
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: filteredParcels.length,
        itemBuilder: (context, index) {
          final parcel = filteredParcels[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ShipmentCard(parcel: parcel),
          );
        },
      ),
    );
  }
}
