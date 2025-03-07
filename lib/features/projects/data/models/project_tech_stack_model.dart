import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';

class ProjectTechStackModel extends ProjectTechStack {
  ProjectTechStackModel({
    required super.id,
    required super.projectId,
    required super.techStack,
  });

  factory ProjectTechStackModel.fromJson(Map<String, dynamic> json) {
    return ProjectTechStackModel(
      id: json['id'] as String? ?? '',
      projectId: json['project_id'] as String? ?? '',
      techStack: json['tech_stack'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project_id': projectId,
      'tech_stack': techStack,
    };
  }
}
