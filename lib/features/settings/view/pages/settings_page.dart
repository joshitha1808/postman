import 'package:flutter/material.dart';
import 'package:postman/core/model/user.dart';
import 'package:postman/features/settings/view/widget/profile_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [ProfileCard(user: User(id: 12))]),
      ),
    );
  }
}
