library shipment;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../widgets/shipment_widgets.dart';

// =========================
// Models
// =========================

enum ShipmentStatus { all, inDelivery, delivered, canceled }

class ShipmentModel {
  const ShipmentModel({
    required this.title,
    required this.trackingId,
    required this.status,
    required this.destination,
    required this.weightKg,
    required this.estimatedArrival,
  });

  final String title;
  final String trackingId;
  final ShipmentStatus status;
  final String destination;
  final int weightKg;
  final DateTime estimatedArrival;
}

// =========================
// ViewModel
// =========================

class ShipmentViewModel extends ChangeNotifier {
  ShipmentViewModel() : _shipments = List.unmodifiable(_seedShipments);

  static final List<ShipmentModel> _seedShipments = <ShipmentModel>[
    ShipmentModel(
      title: 'Nintendo Switch Lite',
      trackingId: '23d45e6ef78',
      status: ShipmentStatus.inDelivery,
      destination: 'Jakarta',
      weightKg: 5,
      estimatedArrival: DateTime(2025, 10, 29),
    ),
    ShipmentModel(
      title: 'Playstation 5 Limited',
      trackingId: '87f6e54d32',
      status: ShipmentStatus.canceled,
      destination: 'Bandung',
      weightKg: 10,
      estimatedArrival: DateTime(2025, 8, 19),
    ),
    ShipmentModel(
      title: 'Xbox Series S Console',
      trackingId: '03a4d1a9c2',
      status: ShipmentStatus.delivered,
      destination: 'Surabaya',
      weightKg: 4,
      estimatedArrival: DateTime(2025, 6, 8),
    ),
    ShipmentModel(
      title: 'Nintendo Switch Pro Controller',
      trackingId: '55b2c1d07f',
      status: ShipmentStatus.inDelivery,
      destination: 'Bogor',
      weightKg: 2,
      estimatedArrival: DateTime(2025, 12, 23),
    ),
  ];

  final List<ShipmentModel> _shipments;
  ShipmentStatus _selected = ShipmentStatus.all;

  List<ShipmentModel> get shipments => _shipments;
  ShipmentStatus get selectedStatus => _selected;

  List<ShipmentModel> get filteredShipments {
    if (_selected == ShipmentStatus.all) return _shipments;
    return _shipments
        .where((s) => s.status == _selected)
        .toList(growable: false);
  }

  void selectTab(ShipmentStatus? status) {
    final next = status ?? ShipmentStatus.all;
    if (next == _selected) return;
    _selected = next;
    notifyListeners();
  }

  String statusLabel(ShipmentStatus status) {
    switch (status) {
      case ShipmentStatus.all:
        return 'All';
      case ShipmentStatus.inDelivery:
        return 'In Delivery';
      case ShipmentStatus.delivered:
        return 'Delivered';
      case ShipmentStatus.canceled:
        return 'Canceled';
    }
  }

  Color statusPillBackground(ShipmentStatus status, _ShipmentColors colors) {
    switch (status) {
      case ShipmentStatus.inDelivery:
        return colors.orangeSoft;
      case ShipmentStatus.delivered:
        return colors.greenSoft;
      case ShipmentStatus.canceled:
        return colors.redSoft;
      case ShipmentStatus.all:
        return colors.purple;
    }
  }

  Color statusPillForeground(ShipmentStatus status, _ShipmentColors colors) {
    switch (status) {
      case ShipmentStatus.inDelivery:
        return colors.orangeText;
      case ShipmentStatus.delivered:
        return colors.greenText;
      case ShipmentStatus.canceled:
        return colors.redText;
      case ShipmentStatus.all:
        return Colors.white;
    }
  }

  String formatDate(DateTime date) {
    const months = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = months[date.month - 1];
    return '$month ${date.day}, ${date.year}';
  }
}

// =========================
// View
// =========================

class ShipmentView extends StatefulWidget {
  const ShipmentView({super.key});

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends State<ShipmentView> {
  late final ShipmentViewModel _viewModel;
  late final _ShipmentColors _colors;

  @override
  void initState() {
    super.initState();
    _viewModel = ShipmentViewModel()..addListener(_onVmChanged);
    _colors = const _ShipmentColors();
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onVmChanged);
    _viewModel.dispose();
    super.dispose();
  }

  void _onVmChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: _colors.background,
      appBar: AppBar(
        backgroundColor: _colors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shipment',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: _colors.title,
          ),
        ),
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: _RoundIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _RoundIconButton(
              icon: Icons.more_horiz_rounded,
              onTap: () {},
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
              selected: _viewModel.selectedStatus,
              colors: _colors,
              onSelected: (status) => _viewModel.selectTab(status),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: _viewModel.filteredShipments.length,
                itemBuilder: (context, index) {
                  final shipment = _viewModel.filteredShipments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ShipmentCard(
                      shipment: shipment,
                      viewModel: _viewModel,
                      colors: _colors,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Back-compat for existing app navigation.
class ShipmentPage extends ShipmentView {
  const ShipmentPage({super.key});
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 44,
          width: 44,
          child: Icon(icon, size: 20, color: const Color(0xFF1D1D1F)),
        ),
      ),
    );
  }
}

class _ShipmentColors {
  const _ShipmentColors();

  final Color background = const Color(0xFFFFEFE6);
  final Color title = const Color(0xFF1D1D1F);

  final Color purple = const Color(0xFF5B4BFF);
  final Color orange = const Color(0xFFF47A2C);

  final Color orangeSoft = const Color(0xFFFFE6D5);
  final Color orangeText = const Color(0xFFB85A1E);

  final Color greenSoft = const Color(0xFFDDF5E3);
  final Color greenText = const Color(0xFF2C7A3F);

  final Color redSoft = const Color(0xFFFFE0E0);
  final Color redText = const Color(0xFFB93838);

  final Color caption = const Color(0xFF6B7280);
  final Color label = const Color(0xFF7A7A80);
  final Color divider = const Color(0xFFEDEDED);
  final Color outline = const Color(0xFFD6D6D6);

  final Color disabled = const Color(0xFFE3E3E3);
  final Color disabledText = const Color(0xFF8E8E93);
}
