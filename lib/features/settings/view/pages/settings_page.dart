import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/settings/view/widget/duty_status_card.dart';
import 'package:postman/features/settings/view/widget/performance_stats_card.dart';
import 'package:postman/features/settings/view/widget/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isOnDuty = true;
  bool _notificationsEnabled = true;
  bool _vibrationAlerts = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: theme.brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              SliverAppBar(
                floating: true,
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Text(
                  "Settings",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () => _showHelpOptions(context),
                    icon: const Icon(Iconsax.message_question),
                  ),
                ],
              ),

              // Profile Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: _buildProfileHeader(context),
                ),
              ),

              // Duty Status
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: DutyStatusCard(
                    isOnDuty: _isOnDuty,
                    currentLocation: 'Connaught Place Post Office, Delhi',
                    lastUpdated: '8:30 AM',
                    onToggle: () {
                      setState(() {
                        _isOnDuty = !_isOnDuty;
                      });
                    },
                    onLocationTap: () {
                      // Refresh location
                    },
                  ),
                ),
              ),

              // Performance Stats
              SliverToBoxAdapter(
                child: PerformanceStatsCard(
                  todayDeliveries: 18,
                  weeklyDeliveries: 127,
                  successRate: 96.5,
                  avgDeliveryTime: '12 min',
                  codCollected: 15450,
                  onViewDetails: () {
                    // Navigate to detailed stats
                  },
                ),
              ),

              // Account & Security
              SliverToBoxAdapter(
                child: SettingsSection(
                  title: 'ACCOUNT & SECURITY',
                  children: [
                    SettingsTile(
                      icon: Iconsax.user_edit,
                      title: 'Edit Profile',
                      subtitle: 'Update your personal information',
                      iconColor: Colors.blue,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Iconsax.password_check,
                      title: 'Change Password',
                      subtitle: 'Update your password',
                      iconColor: Colors.orange,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Iconsax.finger_cricle,
                      title: 'Biometric Login',
                      subtitle: 'Use fingerprint to login',
                      iconColor: Colors.purple,
                      onTap: () {},
                      showDivider: false,
                    ),
                  ],
                ),
              ),

              // Notifications
              SliverToBoxAdapter(
                child: SettingsSection(
                  title: 'NOTIFICATIONS',
                  children: [
                    SettingsSwitchTile(
                      icon: Iconsax.notification,
                      title: 'Push Notifications',
                      subtitle: 'New deliveries, updates & alerts',
                      iconColor: Colors.orange,
                      value: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() => _notificationsEnabled = value);
                      },
                    ),
                    SettingsSwitchTile(
                      icon: Iconsax.happyemoji,
                      title: 'Vibration Alerts',
                      subtitle: 'Vibrate for urgent deliveries',
                      iconColor: Colors.purple,
                      value: _vibrationAlerts,
                      onChanged: (value) {
                        setState(() => _vibrationAlerts = value);
                      },
                    ),
                    SettingsTile(
                      icon: Iconsax.sound,
                      title: 'Notification Sound',
                      subtitle: 'Default',
                      iconColor: Colors.teal,
                      onTap: () {},
                      showDivider: false,
                    ),
                  ],
                ),
              ),

              // Appearance
              SliverToBoxAdapter(
                child: SettingsSection(
                  title: 'APPEARANCE',
                  children: [
                    SettingsSwitchTile(
                      icon: Iconsax.moon,
                      title: 'Dark Mode',
                      subtitle: 'Switch to dark theme',
                      iconColor: Colors.indigo,
                      value: _darkMode,
                      onChanged: (value) {
                        setState(() => _darkMode = value);
                        // Apply theme change
                      },
                    ),
                    SettingsTile(
                      icon: Iconsax.colorfilter,
                      title: 'App Theme',
                      subtitle: 'Blue',
                      iconColor: Colors.blue,
                      onTap: () => _showThemePicker(context),
                    ),
                    SettingsTile(
                      icon: Iconsax.language_square,
                      title: 'Language',
                      subtitle: 'English',
                      iconColor: Colors.green,
                      onTap: () => _showLanguagePicker(context),
                      showDivider: false,
                    ),
                  ],
                ),
              ),

              // Support & Legal
              SliverToBoxAdapter(
                child: SettingsSection(
                  title: 'SUPPORT & LEGAL',
                  children: [
                    SettingsTile(
                      icon: Iconsax.message_question,
                      title: 'Help Center',
                      subtitle: 'FAQs and support',
                      iconColor: Colors.blue,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Iconsax.call,
                      title: 'Contact Supervisor',
                      subtitle: 'Call or message your supervisor',
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Iconsax.document_text,
                      title: 'Terms of Service',
                      iconColor: Colors.grey,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Iconsax.shield_tick,
                      title: 'Privacy Policy',
                      iconColor: Colors.grey,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Iconsax.info_circle,
                      title: 'About',
                      subtitle: 'Version 1.0.0',
                      iconColor: Colors.grey,
                      onTap: () {},
                      showDivider: false,
                    ),
                  ],
                ),
              ),

              // Logout
              SliverToBoxAdapter(
                child: SettingsSection(
                  children: [
                    SettingsTile(
                      icon: Iconsax.logout,
                      title: 'Log Out',
                      isDestructive: true,
                      showDivider: false,
                      onTap: () => _showLogoutConfirmation(context),
                    ),
                  ],
                ),
              ),

              // Bottom padding
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: theme.colorScheme.surfaceContainerLow,
                child: Text(
                  'PS',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.surface,
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Postman Singh',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'ID: PO-DL-12345',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Connaught Place Division, Delhi',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Edit profile
            },
            icon: Icon(Iconsax.edit_2, color: theme.colorScheme.primary),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }

  void _showHelpOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
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
            Text(
              'Need Help?',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Iconsax.call, color: Colors.green),
              ),
              title: const Text('Call Helpline'),
              subtitle: const Text('1800-XXX-XXXX'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Iconsax.message, color: Colors.blue),
              ),
              title: const Text('Chat with Support'),
              subtitle: const Text('Get instant help'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Iconsax.document, color: Colors.orange),
              ),
              title: const Text('Training Materials'),
              subtitle: const Text('Videos & guides'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
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
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Choose Language',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildLanguageOption(context, 'English', 'English', true),
            _buildLanguageOption(context, 'हिंदी', 'Hindi', false),
            _buildLanguageOption(context, 'தமிழ்', 'Tamil', false),
            _buildLanguageOption(context, 'తెలుగు', 'Telugu', false),
            _buildLanguageOption(context, 'ಕನ್ನಡ', 'Kannada', false),
            _buildLanguageOption(context, 'മലയാളം', 'Malayalam', false),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String name,
    String subtitle,
    bool isSelected,
  ) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? Icon(Iconsax.tick_circle, color: theme.colorScheme.primary)
          : null,
      onTap: () => Navigator.pop(context),
    );
  }

  void _showThemePicker(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
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
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Choose Theme',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildThemeChip(context, 'Blue', Colors.blue, true),
                _buildThemeChip(context, 'Sakura', Colors.pink, false),
                _buildThemeChip(context, 'Forest', Colors.green, false),
                _buildThemeChip(context, 'Nightfall', Colors.indigo, false),
                _buildThemeChip(context, 'Cocoa', Colors.brown, false),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeChip(
    BuildContext context,
    String name,
    Color color,
    bool isSelected,
  ) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Icon(Iconsax.tick_circle, color: color, size: 18),
            ],
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text(
          'Are you sure you want to log out? Make sure all your deliveries are synced.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
