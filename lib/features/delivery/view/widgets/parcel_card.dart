import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:url_launcher/url_launcher.dart';

/// Card widget displaying a parcel for delivery
class ParcelCard extends StatelessWidget {
  final Parcel parcel;
  final VoidCallback? onTap;
  final VoidCallback? onNavigate;
  final VoidCallback? onDeliver;
  final VoidCallback? onMarkFailed;

  const ParcelCard({
    super.key,
    required this.parcel,
    this.onTap,
    this.onNavigate,
    this.onDeliver,
    this.onMarkFailed,
  });

  Color _getPriorityColor(DeliveryPriority priority) {
    switch (priority) {
      case DeliveryPriority.urgent:
        return Colors.red;
      case DeliveryPriority.normal:
        return Colors.orange;
      case DeliveryPriority.low:
        return Colors.green;
    }
  }

  Color _getStatusColor(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.pending:
        return Colors.blue;
      case DeliveryStatus.outForDelivery:
        return Colors.orange;
      case DeliveryStatus.delivered:
        return Colors.green;
      case DeliveryStatus.failed:
        return Colors.red;
      case DeliveryStatus.rescheduled:
        return Colors.purple;
    }
  }

  Future<void> _callRecipient() async {
    if (parcel.recipientPhone == null) return;
    final uri = Uri.parse('tel:${parcel.recipientPhone}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final priorityColor = _getPriorityColor(parcel.priority);
    final statusColor = _getStatusColor(parcel.status);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border(left: BorderSide(color: priorityColor, width: 4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.box_1,
                                size: 16,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  parcel.trackingNumber,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _buildChip(
                                parcel.priority.displayLabel.toUpperCase(),
                                priorityColor,
                              ),
                              const SizedBox(width: 8),
                              _buildChip(
                                parcel.status.displayLabel,
                                statusColor,
                              ),
                              if (parcel.isCod) ...[
                                const SizedBox(width: 8),
                                _buildChip(
                                  'COD ${parcel.formattedCodAmount}',
                                  Colors.amber.shade700,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Sequence number if available
                    if (parcel.deliverySequence != null)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${parcel.deliverySequence}',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),

                // Recipient Info
                Row(
                  children: [
                    Icon(
                      Iconsax.user,
                      size: 18,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        parcel.recipientName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (parcel.parcelType != null)
                      Text(
                        parcel.parcelType!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 8),

                // Address
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Iconsax.location,
                      size: 18,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${parcel.recipientAddress}, ${parcel.recipientPincode}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (parcel.hasCustomerPin)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Iconsax.gps,
                              size: 12,
                              color: Colors.green.shade700,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'PIN',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                // Action buttons for active deliveries
                if (parcel.status == DeliveryStatus.outForDelivery) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Call button
                      if (parcel.recipientPhone != null)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _callRecipient,
                            icon: const Icon(Iconsax.call, size: 18),
                            label: const Text('Call'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      if (parcel.recipientPhone != null)
                        const SizedBox(width: 8),

                      // Navigate button
                      if (parcel.hasValidCoordinates)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: onNavigate,
                            icon: const Icon(Iconsax.routing_2, size: 18),
                            label: const Text('Navigate'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      if (parcel.hasValidCoordinates) const SizedBox(width: 8),

                      // Deliver button
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: onDeliver,
                          icon: const Icon(Iconsax.tick_circle, size: 18),
                          label: const Text('Deliver'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
