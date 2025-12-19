part of shipment;

class ShipmentFilterChips extends StatelessWidget {
  const ShipmentFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.colors,
  });

  final ShipmentStatus selected;
  final ValueChanged<ShipmentStatus> onSelected;
  final _ShipmentColors colors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _Chip(
            label: 'All',
            isSelected: selected == ShipmentStatus.all,
            selectedBackground: colors.purple,
            selectedForeground: Colors.white,
            onTap: () => onSelected(ShipmentStatus.all),
          ),
          const SizedBox(width: 12),
          _Chip(
            label: 'In Delivery',
            isSelected: selected == ShipmentStatus.inDelivery,
            selectedBackground: colors.orangeSoft,
            selectedForeground: colors.orangeText,
            onTap: () => onSelected(ShipmentStatus.inDelivery),
          ),
          const SizedBox(width: 12),
          _Chip(
            label: 'Delivered',
            isSelected: selected == ShipmentStatus.delivered,
            selectedBackground: colors.greenSoft,
            selectedForeground: colors.greenText,
            onTap: () => onSelected(ShipmentStatus.delivered),
          ),
          const SizedBox(width: 12),
          _Chip(
            label: 'Cancel',
            isSelected: selected == ShipmentStatus.canceled,
            selectedBackground: colors.redSoft,
            selectedForeground: colors.redText,
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
    required this.colors,
  });

  final ShipmentModel shipment;
  final ShipmentViewModel viewModel;
  final _ShipmentColors colors;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bool isCanceled = shipment.status == ShipmentStatus.canceled;
    final statusLabel = viewModel.statusLabel(shipment.status);
    final statusBg = viewModel.statusPillBackground(shipment.status, colors);
    final statusFg = viewModel.statusPillForeground(shipment.status, colors);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 10),
          ),
        ],
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
                      color: colors.title,
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
                    color: statusBg,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    statusLabel,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: statusFg,
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
                      color: colors.caption,
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
                    color: colors.caption,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: shipment.trackingId));
                  },
                  tooltip: 'Copy tracking id',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(height: 1, color: colors.divider),
            const SizedBox(height: 12),
            _InfoRow(
              label: 'Destination',
              value: shipment.destination,
              colors: colors,
            ),
            const SizedBox(height: 8),
            _InfoRow(
              label: 'Package weight',
              value: '${shipment.weightKg} kg',
              colors: colors,
            ),
            const SizedBox(height: 8),
            _InfoRow(
              label: 'Estimated arrival',
              value: viewModel.formatDate(shipment.estimatedArrival),
              colors: colors,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: isCanceled ? null : () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.orange,
                        disabledBackgroundColor: colors.disabled,
                        foregroundColor: Colors.white,
                        disabledForegroundColor: colors.disabledText,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      icon: Icon(
                        Icons.inventory_2_outlined,
                        size: 18,
                        color: isCanceled ? colors.disabledText : Colors.white,
                      ),
                      label: Text(
                        'Track',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isCanceled
                              ? colors.disabledText
                              : Colors.white,
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
                        foregroundColor: colors.title,
                        side: BorderSide(color: colors.outline),
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
  const _InfoRow({
    required this.label,
    required this.value,
    required this.colors,
  });

  final String label;
  final String value;
  final _ShipmentColors colors;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colors.label,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            color: colors.title,
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

    final background = isSelected ? selectedBackground : Colors.white;
    final foreground = isSelected
        ? selectedForeground
        : const Color(0xFF1D1D1F);

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
