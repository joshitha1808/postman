import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman/core/model/user.dart';
import 'package:postman/core/providers/user_preferences_notifier.dart';

class ProfileCard extends ConsumerStatefulWidget {
  final User? user;
  final bool isProfile;
  const ProfileCard({super.key, this.isProfile = false, required this.user});

  @override
  ConsumerState<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends ConsumerState<ProfileCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefs = ref.watch(userPreferencesNotifierProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(userPrefs.pfpPath),
            ),

            Text(
              widget.user?.id.toString() ?? "N/A",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
