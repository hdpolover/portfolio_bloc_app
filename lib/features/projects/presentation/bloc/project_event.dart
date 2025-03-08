abstract class ProjectEvent {}

class LoadProjects extends ProjectEvent {}

class FilterByTechStack extends ProjectEvent {
  final String? techStack;
  FilterByTechStack(this.techStack);
}

class SortByDate extends ProjectEvent {
  final String? sortOrder;
  SortByDate(this.sortOrder);
}
