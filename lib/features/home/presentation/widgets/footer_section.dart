import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      color: Colors.grey[900],
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© 2024 Portfolio. All rights reserved.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made with Flutter',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
