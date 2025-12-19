import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/core/providers/bottom_nav_provider.dart';
import 'package:postman/features/chat/view/pages/chat_page.dart';
import 'package:postman/features/home/view/pages/home_page.dart';
import 'package:postman/features/settings/view/pages/settings_page.dart';
import 'package:postman/features/shipment/view/pages/shipment_page.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends ConsumerState<BottomNavBar> {
  List<Widget> _buildPages() {
    return const [HomePage(), ShipmentPage(), ChatPage(), SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && currentIndex != 0) {
          ref.read(bottomNavIndexProvider.notifier).state = 0;
        }
      },
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: _buildPages()[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          currentIndex: currentIndex,
          onTap: (index) {
            if (index != currentIndex) {
              ref.read(bottomNavIndexProvider.notifier).state = index;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(Iconsax.home_copy, 0),
              activeIcon: _buildActiveIcon(Iconsax.home, 0),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Iconsax.box_1_copy, 1),
              activeIcon: _buildActiveIcon(Iconsax.box_1, 1),
              label: "Shipment",
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Iconsax.message_copy, 2),
              activeIcon: _buildActiveIcon(Iconsax.message, 2),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Iconsax.setting_copy, 3),
              activeIcon: _buildActiveIcon(Iconsax.setting, 3),
              label: "Settings",
            ),
          ],
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return Container(
      height: 40,
      width: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Icon(icon),
    );
  }

  Widget _buildActiveIcon(IconData icon, int index) {
    return Container(
      height: 40,
      width: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Icon(icon),
    );
  }
}
