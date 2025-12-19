import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/auth/viewmodel/auth_provider.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:postman/features/delivery/view/widgets/parcel_card.dart';
import 'package:postman/features/delivery/viewmodel/delivery_provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// Page displaying the list of deliveries for today
class DeliveryListPage extends ConsumerStatefulWidget {
  const DeliveryListPage({super.key});

  @override
  ConsumerState<DeliveryListPage> createState() => _DeliveryListPageState();
}

class _DeliveryListPageState extends ConsumerState<DeliveryListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<DeliveryStatusFilter> _filterTabs = [
    DeliveryStatusFilter.all,
    DeliveryStatusFilter.pending,
    DeliveryStatusFilter.delivered,
    DeliveryStatusFilter.failed,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _filterTabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final filter = _filterTabs[_tabController.index];
      ref.read(deliveryNotifierProvider.notifier).setFilter(filter);
    }
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

  void _showDeliveryOptions(Parcel parcel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _DeliveryOptionsSheet(
        parcel: parcel,
        onDeliver: () {
          Navigator.pop(context);
          _markAsDelivered(parcel);
        },
        onFailed: () {
          Navigator.pop(context);
          _showFailureReasonDialog(parcel);
        },
      ),
    );
  }

  Future<void> _markAsDelivered(Parcel parcel) async {
    // TODO: Navigate to POD capture page
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('POD capture coming soon...')));
  }

  void _showFailureReasonDialog(Parcel parcel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Failure Reason'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: FailureReason.values.map((reason) {
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

  Future<void> _markAsFailed(Parcel parcel, FailureReason reason) async {
    await ref
        .read(deliveryNotifierProvider.notifier)
        .markFailed(parcel.id, reason: reason);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authNotifierProvider);
    final deliveryState = ref.watch(deliveryNotifierProvider);

    final userName = authState is AuthStateAuthenticated
        ? authState.user.name
        : 'Postman';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(theme, userName),

            // Stats Row
            if (authState is AuthStateAuthenticated)
              _buildStatsRow(theme, authState.user.todayStats),

            // Filter Tabs
            _buildFilterTabs(theme, deliveryState),

            // Delivery List
            Expanded(child: _buildDeliveryContent(deliveryState)),
          ],
        ),
      ),
      floatingActionButton: _buildStartRouteButton(deliveryState),
    );
  }

  Widget _buildHeader(ThemeData theme, String userName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, $userName 👋',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Today\'s Deliveries',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: () {
              // TODO: Notifications
            },
          ),
          IconButton(
            icon: const Icon(Iconsax.setting_2),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(ThemeData theme, dynamic todayStats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          _buildStatCard(
            theme,
            'Pending',
            '${todayStats?.pending ?? 0}',
            Colors.blue,
            Iconsax.timer,
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            theme,
            'Delivered',
            '${todayStats?.delivered ?? 0}',
            Colors.green,
            Iconsax.tick_circle,
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            theme,
            'Failed',
            '${todayStats?.failed ?? 0}',
            Colors.red,
            Iconsax.close_circle,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    ThemeData theme,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs(ThemeData theme, DeliveryListState state) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        labelPadding: const EdgeInsets.symmetric(horizontal: 12),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(text: 'All (${state.countForFilter(DeliveryStatusFilter.all)})'),
          Tab(
            text:
                'Pending (${state.countForFilter(DeliveryStatusFilter.pending)})',
          ),
          Tab(
            text:
                'Delivered (${state.countForFilter(DeliveryStatusFilter.delivered)})',
          ),
          Tab(
            text:
                'Failed (${state.countForFilter(DeliveryStatusFilter.failed)})',
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryContent(DeliveryListState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return _buildErrorState(state.errorMessage!);
    }

    return _buildDeliveryList(state.filteredParcels);
  }

  Widget _buildDeliveryList(List<Parcel> parcels) {
    if (parcels.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        itemCount: parcels.length,
        itemBuilder: (context, index) {
          final parcel = parcels[index];
          return ParcelCard(
            parcel: parcel,
            onTap: () => _showDeliveryOptions(parcel),
            onNavigate: () => _navigateToParcel(parcel),
            onDeliver: () => _showDeliveryOptions(parcel),
            onMarkFailed: () => _showFailureReasonDialog(parcel),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.box_remove,
            size: 64,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No deliveries found',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
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
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.warning_2,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load deliveries',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _onRefresh,
              icon: const Icon(Iconsax.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _buildStartRouteButton(DeliveryListState state) {
    final hasPendingDeliveries =
        state.deliveryList?.parcels.any(
          (p) =>
              p.status == DeliveryStatus.pending ||
              p.status == DeliveryStatus.outForDelivery,
        ) ??
        false;

    if (!hasPendingDeliveries) return null;

    return FloatingActionButton.extended(
      onPressed: () {
        // TODO: Navigate to route optimization
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Route optimization coming soon...')),
        );
      },
      icon: const Icon(Iconsax.routing_2),
      label: const Text('Start Route'),
    );
  }
}

/// Bottom sheet for delivery options
class _DeliveryOptionsSheet extends StatelessWidget {
  final Parcel parcel;
  final VoidCallback onDeliver;
  final VoidCallback onFailed;

  const _DeliveryOptionsSheet({
    required this.parcel,
    required this.onDeliver,
    required this.onFailed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Iconsax.box_1, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      parcel.trackingNumber,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      parcel.recipientName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: onDeliver,
            icon: const Icon(Iconsax.tick_circle),
            label: const Text('Mark as Delivered'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onFailed,
            icon: const Icon(Iconsax.close_circle),
            label: const Text('Mark as Failed'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              foregroundColor: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
