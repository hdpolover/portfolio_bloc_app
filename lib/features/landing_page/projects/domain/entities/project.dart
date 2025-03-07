class Project {
  final String id;
  final String title;
  final String description;
  final String githubLink;
  final String liveDemoLink;
  final List<String> techStack;
  final List<String> images;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.githubLink,
    required this.liveDemoLink,
    required this.techStack,
    this.images = const [],
  });
}
