import 'package:portofolio_bloc_app/features/projects/data/models/tech_stack_model.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';

class ProjectTechStackModel extends ProjectTechStack {
  ProjectTechStackModel({
    required super.id,
    required super.projectId,
    required super.techStack,
    required super.techStackDetails,
  });

  factory ProjectTechStackModel.fromJson(Map<String, dynamic> json) {
    return ProjectTechStackModel(
      id: json['id'] as String? ?? '',
      projectId: json['project_id'] as String? ?? '',
      techStack: json['tech_stack'] as String? ?? '',
      techStackDetails:
          TechStackModel.fromJson(json['tech_stacks'] as Map<String, dynamic>),
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
