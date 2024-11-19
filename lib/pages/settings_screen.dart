import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/gen/assets.gen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 90),
              margin: const EdgeInsets.symmetric(horizontal: 48),
              width: context.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Column(
                children: [
                  SettingsCard(icon: Icons.settings, title: 'Account Settings'),
                  SettingsCard(icon: Icons.logout, title: 'Log Out'),
                  SettingsCard(icon: Icons.account_circle, title: 'Switch Account'),
                  SettingsCard(icon: Icons.help_outline, title: 'Help'),
                  SettingsCard(icon: Icons.info_outline, title: 'About Love Knot'),
                ],
              ),
            ),
            Image.asset(Assets.images.leftHearhtPicture.path),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const SettingsCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, size: 32),
          const SizedBox(width: 20),
          Text(
            title,
            style: context.titleMedium,
          ),
        ],
      ),
    );
  }
}
