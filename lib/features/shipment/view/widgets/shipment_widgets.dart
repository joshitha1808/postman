part of '../pages/shipment_page.dart';

class ShipmentFilterChips extends StatelessWidget {
  const ShipmentFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ShipmentStatus selected;
  final ValueChanged<ShipmentStatus> onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _Chip(
            label: 'All',
            isSelected: selected == ShipmentStatus.all,
            selectedBackground: colorScheme.primaryContainer,
            selectedForeground: colorScheme.onPrimaryContainer,
            onTap: () => onSelected(ShipmentStatus.all),
          ),
          const SizedBox(width: 12),
          _Chip(
            label: 'In Delivery',
            isSelected: selected == ShipmentStatus.inDelivery,
            selectedBackground: colorScheme.tertiaryContainer,
            selectedForeground: colorScheme.onTertiaryContainer,
            onTap: () => onSelected(ShipmentStatus.inDelivery),
          ),
          const SizedBox(width: 12),
          _Chip(
            label: 'Delivered',
            isSelected: selected == ShipmentStatus.delivered,
            selectedBackground: colorScheme.secondaryContainer,
            selectedForeground: colorScheme.onSecondaryContainer,
            onTap: () => onSelected(ShipmentStatus.delivered),
          ),
          const SizedBox(width: 12),
          _Chip(
            label: 'Cancel',
            isSelected: selected == ShipmentStatus.canceled,
            selectedBackground: colorScheme.errorContainer,
            selectedForeground: colorScheme.onErrorContainer,
            onTap: () => onSelected(ShipmentStatus.canceled),
          ),
        ],
      ),
    );
  }
}

class ShipmentCard extends StatelessWidget {
  const ShipmentCard({
    super.key,
    required this.shipment,
    required this.viewModel,
  });

  final ShipmentModel shipment;
  final ShipmentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final bool isCanceled = shipment.status == ShipmentStatus.canceled;
    final statusLabel = viewModel.statusLabel(shipment.status);
    final statusColors = _statusPillColors(shipment.status, colorScheme);

    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    shipment.title,
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColors.background,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    statusLabel,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: statusColors.foreground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '#${shipment.trackingId}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints.tightFor(
                    width: 34,
                    height: 34,
                  ),
                  icon: Icon(
                    Icons.copy_rounded,
                    size: 18,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: shipment.trackingId));
                  },
                  tooltip: 'Copy tracking id',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(height: 1, color: colorScheme.outlineVariant),
            const SizedBox(height: 12),
            _InfoRow(label: 'Destination', value: shipment.destination),
            const SizedBox(height: 8),
            _InfoRow(label: 'Package weight', value: '${shipment.weightKg} kg'),
            const SizedBox(height: 8),
            _InfoRow(
              label: 'Estimated arrival',
              value: viewModel.formatDate(shipment.estimatedArrival),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: isCanceled ? null : () {},
                      icon: Icon(Icons.inventory_2_outlined, size: 18),
                      label: Text(
                        'Track',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Text(
                        'View Details',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.isSelected,
    required this.selectedBackground,
    required this.selectedForeground,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final Color selectedBackground;
  final Color selectedForeground;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final background = isSelected ? selectedBackground : colorScheme.surface;
    final foreground = isSelected ? selectedForeground : colorScheme.onSurface;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusPillColors {
  const _StatusPillColors({required this.background, required this.foreground});

  final Color background;
  final Color foreground;
}

_StatusPillColors _statusPillColors(
  ShipmentStatus status,
  ColorScheme colorScheme,
) {
  switch (status) {
    case ShipmentStatus.all:
      return _StatusPillColors(
        background: colorScheme.primaryContainer,
        foreground: colorScheme.onPrimaryContainer,
      );
    case ShipmentStatus.inDelivery:
      return _StatusPillColors(
        background: colorScheme.tertiaryContainer,
        foreground: colorScheme.onTertiaryContainer,
      );
    case ShipmentStatus.delivered:
      return _StatusPillColors(
        background: colorScheme.secondaryContainer,
        foreground: colorScheme.onSecondaryContainer,
      );
    case ShipmentStatus.canceled:
      return _StatusPillColors(
        background: colorScheme.errorContainer,
        foreground: colorScheme.onErrorContainer,
      );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 44,
          width: 44,
          child: Icon(icon, size: 20, color: colorScheme.onSurface),
        ),
      ),
    );
  }
}
