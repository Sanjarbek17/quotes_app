
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

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
