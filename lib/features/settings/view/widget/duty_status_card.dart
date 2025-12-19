import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DutyStatusCard extends StatelessWidget {
  final bool isOnDuty;
  final String? currentLocation;
  final String? lastUpdated;
  final VoidCallback? onToggle;
  final VoidCallback? onLocationTap;

  const DutyStatusCard({
    super.key,
    required this.isOnDuty,
    this.currentLocation,
    this.lastUpdated,
    this.onToggle,
    this.onLocationTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = isOnDuty ? Colors.green : Colors.grey;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Status Indicator
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isOnDuty ? Iconsax.flash : Iconsax.flash_slash,
                  color: statusColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                            boxShadow: isOnDuty
                                ? [
                                    BoxShadow(
                                      color: statusColor.withValues(alpha: 0.5),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isOnDuty ? 'On Duty' : 'Off Duty',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isOnDuty
                                ? theme.colorScheme.onPrimaryContainer
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    if (lastUpdated != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Since $lastUpdated',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color:
                              (isOnDuty
                                      ? theme.colorScheme.onPrimaryContainer
                                      : theme.colorScheme.onSurface)
                                  .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Toggle Switch
              Switch.adaptive(
                value: isOnDuty,
                onChanged: onToggle != null ? (_) => onToggle!() : null,
                activeColor: Colors.green,
                activeTrackColor: Colors.green.withValues(alpha: 0.3),
              ),
            ],
          ),
          if (currentLocation != null && isOnDuty) ...[
            const SizedBox(height: 16),
            InkWell(
              onTap: onLocationTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Iconsax.gps,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Location',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                          Text(
                            currentLocation!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Iconsax.refresh,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
