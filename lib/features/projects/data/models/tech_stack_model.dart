import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';

class TechStackModel extends TechStack {
  const TechStackModel({
    required super.id,
    required super.name,
  });

  factory TechStackModel.fromJson(Map<String, dynamic> json) {
    return TechStackModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TechStackModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
