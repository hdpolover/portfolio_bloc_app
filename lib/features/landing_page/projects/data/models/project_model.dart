import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.techStack,
    required super.githubLink,
    required super.liveDemoLink,
    super.images = const [],
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
        techStack: _parseStringList(json['tech_stack']),
        githubLink: json['github_link'] as String? ?? '',
        liveDemoLink: json['live_demo_link'] as String? ?? '',
        images: _parseStringList(json['images']),
      );
    } catch (e, stackTrace) {
      LoggerService.logError('Error in ProjectModel.fromJson: $e');
      LoggerService.logError('JSON data: $json');
      LoggerService.logError(stackTrace.toString());
      rethrow;
    }
  }

  // Helper method to safely parse lists
  static List<String> _parseStringList(dynamic value) {
    if (value == null) {
      return [];
    }

    try {
      if (value is List) {
        return value.map((item) => item.toString()).toList();
      }
      return [];
    } catch (e) {
      LoggerService.logError('Error parsing list: $e');
      return [];
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
    };
  }
}
