import '../../domain/entities/project.dart';

abstract class ProjectState {
  final String? selectedTechStack;
  final String? sortByDate;

  const ProjectState({
    this.selectedTechStack,
    this.sortByDate,
  });
}

class ProjectInitial extends ProjectState {
  const ProjectInitial() : super();
}

class ProjectLoading extends ProjectState {
  const ProjectLoading() : super();
}

class ProjectOneLoaded extends ProjectState {
  final Project project;

  const ProjectOneLoaded({
    required this.project,
    super.selectedTechStack,
    super.sortByDate,
  });

  ProjectOneLoaded copyWith({
    Project? project,
    String? selectedTechStack,
    String? sortByDate,
  }) {
    return ProjectOneLoaded(
      project: project ?? this.project,
      selectedTechStack: selectedTechStack ?? super.selectedTechStack,
      sortByDate: sortByDate ?? super.sortByDate,
    );
  }
}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;

  const ProjectLoaded({
    required this.projects,
    super.selectedTechStack,
    super.sortByDate,
  });

  ProjectLoaded copyWith({
    List<Project>? projects,
    String? selectedTechStack,
    String? sortByDate,
  }) {
    return ProjectLoaded(
      projects: projects ?? this.projects,
      selectedTechStack: selectedTechStack ?? super.selectedTechStack,
      sortByDate: sortByDate ?? super.sortByDate,
    );
  }
}

class ProjectError extends ProjectState {
  final String message;
  ProjectError(this.message);
}
