import 'package:flutter/material.dart';
import 'package:postman/features/settings/view/widget/find_postman_map_mock.dart';
import 'package:postman/features/settings/view/widget/find_postman_tracking_sheet.dart';

class FindPostmanPage extends StatefulWidget {
  const FindPostmanPage({super.key});

  @override
  State<FindPostmanPage> createState() => _FindPostmanPageState();
}

class _FindPostmanPageState extends State<FindPostmanPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Find Postman'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Filters',
            icon: const Icon(Icons.tune),
            onPressed: () {
              // Prototype: no filters yet
            },
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {
              // Prototype: no search yet
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: FindPostmanMapMock(progress: _controller, showRoute: true),
            ),

            // Recenter button
            Positioned(
              right: 16,
              bottom: 220,
              child: ThemedCircleIconButton(
                icon: Icons.my_location,
                onTap: () {
                  // Prototype: no real map controller
                },
              ),
            ),

            // Bottom sheet
            const Align(
              alignment: Alignment.bottomCenter,
              child: FindPostmanTrackingSheet(),
            ),
          ],
        ),
      ),
    );
  }
}
