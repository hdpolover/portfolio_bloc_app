import 'package:flutter/material.dart';
import 'package:portofolio_bloc_app/features/dashboard/presentation/pages/tabs/projects/add_project_content.dart';

class ProjectContent extends StatefulWidget {
  const ProjectContent({super.key});

  @override
  State<ProjectContent> createState() => _ProjectContentState();
}

class _ProjectContentState extends State<ProjectContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Projects",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigate to add project page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProjectContent(),
                      ));
                },
                child: const Text("Add Project"),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("Project ${index + 1}"),
                    subtitle: Text("Description of project ${index + 1}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
