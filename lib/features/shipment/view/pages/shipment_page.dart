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

  @override
  void initState() {
    super.initState();
    _viewModel = ShipmentViewModel()..addListener(_onVmChanged);
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shipment',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: colorScheme.onSurface,
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
