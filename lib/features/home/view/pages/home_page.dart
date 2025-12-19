import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/home/view/widgets/delivery_stat_card.dart';
import 'package:postman/features/home/view/widgets/delivery_task_card.dart';
import 'package:postman/features/home/view/widgets/quick_action_button.dart';
import 'package:postman/features/home/view/widgets/route_info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isRouteActive = false;

  // Mock data - Replace with actual data from providers
  final List<DeliveryTask> _todaysTasks = [
    const DeliveryTask(
      id: '1',
      trackingId: 'EK123456789IN',
      recipientName: 'Rajesh Kumar',
      address: '42, MG Road, Sector 18, Near Metro Station',
      pincode: '110001',
      phone: '+91 98765 43210',
      priority: DeliveryPriority.urgent,
      status: DeliveryStatus.pending,
      estimatedTime: '10:30',
      isCOD: true,
      codAmount: 1299,
      packageType: 'Speed Post',
    ),
    const DeliveryTask(
      id: '2',
      trackingId: 'EM987654321IN',
      recipientName: 'Priya Sharma',
      address: '15, Nehru Nagar, Block C, Apartment 203',
      pincode: '110002',
      phone: '+91 87654 32109',
      priority: DeliveryPriority.normal,
      status: DeliveryStatus.pending,
      estimatedTime: '11:15',
      packageType: 'Registered Post',
    ),
    const DeliveryTask(
      id: '3',
      trackingId: 'EL456789123IN',
      recipientName: 'Amit Patel',
      address: '78, Lajpat Nagar, 2nd Floor, Above SBI Bank',
      pincode: '110024',
      phone: '+91 76543 21098',
      priority: DeliveryPriority.normal,
      status: DeliveryStatus.inTransit,
      estimatedTime: '12:00',
      isCOD: true,
      codAmount: 450,
      packageType: 'Parcel',
    ),
    const DeliveryTask(
      id: '4',
      trackingId: 'EK789123456IN',
      recipientName: 'Sunita Devi',
      address: '23, Gandhi Colony, Near Post Office',
      pincode: '110003',
      phone: '+91 65432 10987',
      priority: DeliveryPriority.low,
      status: DeliveryStatus.pending,
      estimatedTime: '14:30',
      packageType: 'Ordinary Post',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pendingCount = _todaysTasks
        .where((t) => t.status == DeliveryStatus.pending)
        .length;
    final inTransitCount = _todaysTasks
        .where((t) => t.status == DeliveryStatus.inTransit)
        .length;
    final deliveredCount = _todaysTasks
        .where((t) => t.status == DeliveryStatus.delivered)
        .length;

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
            onRefresh: () async {
              // Refresh data
              await Future.delayed(const Duration(seconds: 1));
            },
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
                            'PS',
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
                                'Good Morning,',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              ),
                              Text(
                                'Postman Singh',
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

                // Delivery Stats
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
                              onTap: () {},
                            ),
                            const SizedBox(width: 12),
                            DeliveryStatCard(
                              title: 'In Transit',
                              count: inTransitCount.toString(),
                              icon: Iconsax.truck_fast,
                              color: Colors.blue,
                              onTap: () {},
                            ),
                            const SizedBox(width: 12),
                            DeliveryStatCard(
                              title: 'Delivered',
                              count: deliveredCount.toString(),
                              icon: Iconsax.tick_circle,
                              color: Colors.green,
                              onTap: () {},
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
                        // Open map view
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
                                  // Open scanner
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
                                  // Record pickup
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
                                  // Report issue
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
                                  // COD collection
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
                            '${_todaysTasks.length} items',
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

                // Delivery Tasks List
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final task = _todaysTasks[index];
                      return DeliveryTaskCard(
                        task: task,
                        onTap: () {
                          // Open task details
                        },
                        onNavigate: () {
                          // Open navigation
                        },
                        onCall: () {
                          // Call recipient
                        },
                        onDeliver: () {
                          // Mark as delivered
                          _showDeliveryConfirmation(context, task);
                        },
                      );
                    }, childCount: _todaysTasks.length),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Quick scan action
        },
        icon: const Icon(Iconsax.scan_barcode),
        label: const Text('Scan Package'),
        elevation: 4,
      ),
    );
  }

  void _showDeliveryConfirmation(BuildContext context, DeliveryTask task) {
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
              'Package ${task.trackingId}',
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
                // Open camera
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
                // Open signature pad
              },
            ),
            if (task.isCOD)
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
                subtitle: Text(
                  'Amount: ₹${task.codAmount?.toStringAsFixed(2) ?? '0'}',
                ),
                trailing: const Icon(Iconsax.arrow_right_3),
                onTap: () {
                  Navigator.pop(context);
                  // Open COD collection
                },
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Confirm delivery
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Delivery confirmed for ${task.trackingId}',
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
}
