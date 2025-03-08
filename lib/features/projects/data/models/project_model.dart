import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/features/projects/data/models/project_image_model.dart';
import 'package:portofolio_bloc_app/features/projects/data/models/project_tech_stack_model.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.techStack,
    required super.githubLink,
    required super.liveDemoLink,
    super.images = const [],
    required super.createdAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    try {
      // For debugging purposes
      LoggerService.logInfo('Parsing project: ${json['id']}');

      // Handle snake_case field names from Supabase
      return ProjectModel(
        id: json['id']?.toString() ?? '',
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        techStack: (json['project_techs'] as List<dynamic>?)
                ?.map((tech) => ProjectTechStackModel.fromJson(
                    tech as Map<String, dynamic>))
                .toList() ??
            [],
        githubLink: json['github_link'] as String? ?? '',
        liveDemoLink: json['live_demo_link'] as String? ?? '',
        images: (json['project_images'] as List<dynamic>?)
                ?.map((image) =>
                    ProjectImageModel.fromJson(image as Map<String, dynamic>))
                .toList() ??
            [],
        createdAt: DateTime.parse(json['created_at'] as String? ?? ''),
      );
    } catch (e, stackTrace) {
      LoggerService.logError('Error in ProjectModel.fromJson: $e');
      LoggerService.logError('JSON data: $json');
      LoggerService.logError(stackTrace.toString());
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tech_stack': techStack,
      'github_link': githubLink,
      'live_demo_link': liveDemoLink,
      'images': images,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
