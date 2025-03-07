import 'package:flutter/material.dart';
import 'package:portofolio_bloc_app/core/widgets/base_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: _buildAboutContent(context),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),

          // Add your bio information here
          Text(
            'Hi, I\'m Hendra, a passionate software developer specializing in Flutter and Dart development.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'With experience in mobile and web development, I focus on creating responsive, user-friendly applications that solve real-world problems.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          // Skills section
          const SizedBox(height: 30),
          Text(
            'Skills',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillChip('Flutter'),
              _buildSkillChip('Dart'),
              _buildSkillChip('Firebase'),
              _buildSkillChip('REST API'),
              _buildSkillChip('State Management'),
              _buildSkillChip('UI/UX Design'),
            ],
          ),

          // You can add more sections like Education, Experience, etc.
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.blue.withOpacity(0.1),
    );
  }
}
