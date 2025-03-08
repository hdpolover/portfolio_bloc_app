class Project {
  final String id;
  final String title;
  final String description;
  final String githubLink;
  final String liveDemoLink;
  final List<ProjectTechStack> techStack;
  final List<ProjectImage> images;
  final DateTime createdAt;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.githubLink,
    required this.liveDemoLink,
    required this.techStack,
    this.images = const [],
    required this.createdAt,
  });
}

class ProjectImage {
  final String id;
  final String projectId;
  final String imageUrl;
  final int order;

  const ProjectImage({
    required this.id,
    required this.projectId,
    required this.imageUrl,
    required this.order,
  });
}

class ProjectTechStack {
  final String id;
  final String projectId;
  final String techStack;
  final TechStack techStackDetails;

  const ProjectTechStack({
    required this.id,
    required this.projectId,
    required this.techStack,
    required this.techStackDetails,
  });
}

class TechStack {
  final String id;
  final String name;

  const TechStack({
    required this.id,
    required this.name,
  });
}
