import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(Icons.email, () {
                // Add email action here
              }),
              _socialIcon(Icons.facebook, () {
                // Add Facebook action here
              }),
              _socialIcon(Icons.link, () {
                // Add LinkedIn or other link action here
              }),
              _socialIcon(Icons.account_circle, () {
                // Add profile or GitHub action here
              }),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            '© $currentYear Hendra. All rights reserved.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        tooltip: icon.codePoint.toString(),
      ),
    );
  }
}
