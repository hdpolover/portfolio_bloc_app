import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';

class ProjectImageModel extends ProjectImage {
  ProjectImageModel({
    required super.id,
    required super.projectId,
    required super.imageUrl,
    required super.order,
  });

  factory ProjectImageModel.fromJson(Map<String, dynamic> json) {
    return ProjectImageModel(
      id: json['id'] as String? ?? '',
      projectId: json['project_id'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      order: json['order'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project_id': projectId,
      'image_url': imageUrl,
      'order': order,
    };
  }
}
