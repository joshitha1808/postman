import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/auth/viewmodel/auth_provider.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart'
    as delivery_enums;
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:postman/features/delivery/model/status_update.dart';
import 'package:postman/features/delivery/viewmodel/delivery_provider.dart';
import 'package:postman/features/home/view/widgets/delivery_stat_card.dart';
import 'package:postman/features/home/view/widgets/delivery_task_card.dart';
import 'package:postman/features/home/view/widgets/quick_action_button.dart';
import 'package:postman/features/home/view/widgets/route_info_card.dart';
import 'package:postman/features/home/view/pages/live_map_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load deliveries on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deliveryNotifierProvider.notifier).loadDeliveries();
    });
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning,';
    if (hour < 17) return 'Good Afternoon,';
    return 'Good Evening,';
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.length >= 2
        ? name.substring(0, 2).toUpperCase()
        : name.toUpperCase();
  }

  Future<void> _onRefresh() async {
    await ref.read(deliveryNotifierProvider.notifier).loadDeliveries();
  }

  void _navigateToParcel(Parcel parcel) async {
    if (!parcel.hasValidCoordinates) return;

    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=${parcel.deliveryLat},${parcel.deliveryLng}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _callRecipient(Parcel parcel) async {
    if (parcel.recipientPhone == null) return;
    final uri = Uri.parse('tel:${parcel.recipientPhone}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showDeliveryConfirmation(BuildContext context, Parcel parcel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Icon(
              Iconsax.tick_circle,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Confirm Delivery',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Package ${parcel.trackingNumber}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            // Proof of Delivery Options
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Iconsax.camera, color: Colors.blue),
              ),
              title: const Text('Take Photo'),
              subtitle: const Text('Capture proof of delivery'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () {
                Navigator.pop(context);
                // TODO: Open camera for POD
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('POD capture coming soon...')),
                );
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Iconsax.edit_2, color: Colors.purple),
              ),
              title: const Text('Collect Signature'),
              subtitle: const Text('Get recipient signature'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () {
                Navigator.pop(context);
                // TODO: Open signature pad
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Signature capture coming soon...'),
                  ),
                );
              },
            ),
            if (parcel.isCod)
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Iconsax.money_recive, color: Colors.green),
                ),
                title: const Text('Collect COD'),
                subtitle: Text('Amount: ${parcel.formattedCodAmount}'),
                trailing: const Icon(Iconsax.arrow_right_3),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Open COD collection
                },
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showFailureReasonDialog(parcel);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Mark Failed'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Implement full POD flow
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Delivery confirmed for ${parcel.trackingNumber}',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showFailureReasonDialog(Parcel parcel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Failure Reason'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: delivery_enums.FailureReason.values.map((reason) {
            return ListTile(
              title: Text(reason.displayLabel),
              onTap: () {
                Navigator.pop(context);
                _markAsFailed(parcel, reason);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _markAsFailed(
    Parcel parcel,
    delivery_enums.FailureReason reason,
  ) async {
    final success = await ref
        .read(deliveryNotifierProvider.notifier)
        .markFailed(parcel.id, reason: reason);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? 'Marked as failed: ${reason.displayLabel}'
                : 'Failed to update status',
          ),
          backgroundColor: success ? Colors.orange : Colors.red,
        ),
      );
    }
  }

  void _onStartRoute() async {
    final deliveryState = ref.read(deliveryNotifierProvider);
    if (deliveryState.isRouteActive) {
      // Route already active
      return;
    }

    // Mark all pending as out for delivery
    final pendingParcels =
        deliveryState.deliveryList?.parcels
            .where((p) => p.status == delivery_enums.DeliveryStatus.pending)
            .toList() ??
        [];

    for (final parcel in pendingParcels) {
      await ref
          .read(deliveryNotifierProvider.notifier)
          .updateParcelStatus(
            parcelId: parcel.id,
            request: StatusUpdateRequest.outForDelivery(),
          );
    }

    // Refresh the list
    await ref.read(deliveryNotifierProvider.notifier).loadDeliveries();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authNotifierProvider);
    final deliveryState = ref.watch(deliveryNotifierProvider);

    // Get user info
    final userName = authState is AuthStateAuthenticated
        ? authState.user.name
        : 'Postman';
    final initials = authState is AuthStateAuthenticated
        ? _getInitials(authState.user.name)
        : 'PS';

    // Get stats from delivery state
    final deliveryList = deliveryState.deliveryList;
    final pendingCount = deliveryList?.pendingCount ?? 0;
    final outForDeliveryCount = deliveryList?.outForDeliveryCount ?? 0;
    final deliveredCount = deliveryList?.deliveredCount ?? 0;
    final totalParcels = deliveryList?.totalParcels ?? 0;

    // Get parcels for display
    final parcels = deliveryState.filteredParcels;

    // Find next stop (first pending or out for delivery parcel)
    final nextParcel = parcels.isNotEmpty
        ? parcels.firstWhere(
            (p) =>
                p.status == delivery_enums.DeliveryStatus.pending ||
                p.status == delivery_enums.DeliveryStatus.outForDelivery,
            orElse: () => parcels.first,
          )
        : null;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: theme.brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              slivers: [
                // App Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Row(
                      children: [
                        // Profile Avatar
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Text(
                            initials,
                            style: TextStyle(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getGreeting(),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              ),
                              Text(
                                userName,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Notification Bell
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Open notifications
                              },
                              icon: const Icon(Iconsax.notification),
                              style: IconButton.styleFrom(
                                backgroundColor: theme
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: theme.colorScheme.surface,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Loading indicator
                if (deliveryState.isLoading)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),

                // Error message
                if (deliveryState.errorMessage != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Iconsax.warning_2, color: Colors.red),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                deliveryState.errorMessage!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Iconsax.refresh),
                              onPressed: _onRefresh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Delivery Stats
                if (!deliveryState.isLoading)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today's Summary",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // View detailed stats
                                },
                                child: const Text('View All'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              DeliveryStatCard(
                                title: 'Pending',
                                count: pendingCount.toString(),
                                icon: Iconsax.timer_1,
                                color: Colors.orange,
                                onTap: () {
                                  ref
                                      .read(deliveryNotifierProvider.notifier)
                                      .setFilter(DeliveryStatusFilter.pending);
                                },
                              ),
                              const SizedBox(width: 12),
                              DeliveryStatCard(
                                title: 'In Transit',
                                count: outForDeliveryCount.toString(),
                                icon: Iconsax.truck_fast,
                                color: Colors.blue,
                                onTap: () {
                                  ref
                                      .read(deliveryNotifierProvider.notifier)
                                      .setFilter(DeliveryStatusFilter.pending);
                                },
                              ),
                              const SizedBox(width: 12),
                              DeliveryStatCard(
                                title: 'Delivered',
                                count: deliveredCount.toString(),
                                icon: Iconsax.tick_circle,
                                color: Colors.green,
                                onTap: () {
                                  ref
                                      .read(deliveryNotifierProvider.notifier)
                                      .setFilter(
                                        DeliveryStatusFilter.delivered,
                                      );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                // Route Info Card
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: RouteInfoCard(
                      totalStops: _todaysTasks.length,
                      completedStops: deliveredCount,
                      estimatedDistance: '12.5 km',
                      estimatedTime: '2h 30m',
                      nextStop: 'Rajesh Kumar - MG Road, Sector 18',
                      isRouteActive: _isRouteActive,
                      onStartRoute: () {
                        setState(() {
                          _isRouteActive = !_isRouteActive;
                        });
                      },
                      onViewRoute: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const LiveMapPage(),
                          ),
                        );
                      },
                if (!deliveryState.isLoading && deliveryList != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      child: RouteInfoCard(
                        totalStops: totalParcels,
                        completedStops: deliveredCount,
                        estimatedDistance:
                            '-- km', // TODO: From route optimization
                        estimatedTime:
                            '-- min', // TODO: From route optimization
                        nextStop: nextParcel != null
                            ? '${nextParcel.recipientName} - ${nextParcel.recipientAddress}'
                            : 'No pending deliveries',
                        isRouteActive: deliveryState.isRouteActive,
                        onStartRoute: _onStartRoute,
                        onViewRoute: () {
                          // TODO: Open map view
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Route optimization coming soon...',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                // Quick Actions
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Actions',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: QuickActionButton(
                                icon: Iconsax.scan_barcode,
                                label: 'Scan',
                                color: theme.colorScheme.primary,
                                onTap: () {
                                  // TODO: Open scanner
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: QuickActionButton(
                                icon: Iconsax.document_upload,
                                label: 'Pickup',
                                color: Colors.purple,
                                onTap: () {
                                  // TODO: Record pickup
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: QuickActionButton(
                                icon: Iconsax.message_question,
                                label: 'Report',
                                color: Colors.red,
                                onTap: () {
                                  // TODO: Report issue
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: QuickActionButton(
                                icon: Iconsax.money_recive,
                                label: 'COD',
                                color: Colors.green,
                                onTap: () {
                                  // TODO: COD collection
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Today's Deliveries Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Deliveries",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${parcels.length} items',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Empty state
                if (!deliveryState.isLoading && parcels.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Icon(
                            Iconsax.box_remove,
                            size: 64,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No deliveries found',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton.icon(
                            onPressed: _onRefresh,
                            icon: const Icon(Iconsax.refresh),
                            label: const Text('Refresh'),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Delivery Tasks List
                if (!deliveryState.isLoading && parcels.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final parcel = parcels[index];
                        return DeliveryTaskCard(
                          task: _parcelToTask(parcel),
                          onTap: () {
                            // Open task details
                          },
                          onNavigate: () => _navigateToParcel(parcel),
                          onCall: () => _callRecipient(parcel),
                          onDeliver: () {
                            _showDeliveryConfirmation(context, parcel);
                          },
                        );
                      }, childCount: parcels.length),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Quick scan action
        },
        icon: const Icon(Iconsax.scan_barcode),
        label: const Text('Scan Package'),
        elevation: 4,
      ),
    );
  }

  /// Convert Parcel model to DeliveryTask for the existing card widget
  DeliveryTask _parcelToTask(Parcel parcel) {
    return DeliveryTask(
      id: parcel.id,
      trackingId: parcel.trackingNumber,
      recipientName: parcel.recipientName,
      address: parcel.recipientAddress,
      pincode: parcel.recipientPincode,
      phone: parcel.recipientPhone ?? '',
      priority: _mapPriority(parcel.priority),
      status: _mapStatus(parcel.status),
      isCOD: parcel.isCod,
      codAmount: parcel.codAmount,
      packageType: parcel.parcelType ?? 'Parcel',
    );
  }

  DeliveryPriority _mapPriority(delivery_enums.DeliveryPriority priority) {
    switch (priority) {
      case delivery_enums.DeliveryPriority.urgent:
        return DeliveryPriority.urgent;
      case delivery_enums.DeliveryPriority.normal:
        return DeliveryPriority.normal;
      case delivery_enums.DeliveryPriority.low:
        return DeliveryPriority.low;
    }
  }

  DeliveryStatus _mapStatus(delivery_enums.DeliveryStatus status) {
    switch (status) {
      case delivery_enums.DeliveryStatus.pending:
        return DeliveryStatus.pending;
      case delivery_enums.DeliveryStatus.outForDelivery:
        return DeliveryStatus.inTransit;
      case delivery_enums.DeliveryStatus.delivered:
        return DeliveryStatus.delivered;
      case delivery_enums.DeliveryStatus.failed:
        return DeliveryStatus.failed;
      case delivery_enums.DeliveryStatus.rescheduled:
        return DeliveryStatus.attempted;
    }
  }
}
