abstract class ProjectEvent {}

class LoadProjects extends ProjectEvent {}

class LoadProjectById extends ProjectEvent {
  final String projectId;
  LoadProjectById(this.projectId);
}

class FilterByTechStack extends ProjectEvent {
  final String? techStack;
  FilterByTechStack(this.techStack);
}

class SortByDate extends ProjectEvent {
  final String? sortOrder;
  SortByDate(this.sortOrder);
}
