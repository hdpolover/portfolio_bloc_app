import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';

import '../../domain/usecases/get_all_projects.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjects getAllProjects;

  ProjectBloc({required this.getAllProjects}) : super(ProjectInitial()) {
    on<LoadProjects>(_loadProjects);
    on<FilterByTechStack>(_filterByTechStack);
    on<SortByDate>(_sortByDate);
  }

  Future<void> _loadProjects(
      LoadProjects event, Emitter<ProjectState> emit) async {
    try {
      LoggerService.logInfo('ProjectBloc: Loading projects...');
      emit(const ProjectLoading());

      final result = await getAllProjects();

      LoggerService.logInfo('ProjectBloc: Got result from getAllProjects');

      result.fold(
        (failure) {
          LoggerService.logError(
              'ProjectBloc: Error loading projects - ${failure.message}');
          emit(ProjectError(failure.message));
        },
        (projects) {
          LoggerService.logInfo(
              'ProjectBloc: Loaded ${projects.length} projects');
          emit(ProjectLoaded(projects: projects));
        },
      );
    } catch (e, stackTrace) {
      LoggerService.logError('ProjectBloc: Exception occurred: $e');
      LoggerService.logError(stackTrace.toString());
      emit(ProjectError('An unexpected error occurred: $e'));
    }
  }

  void _filterByTechStack(FilterByTechStack event, Emitter<ProjectState> emit) {
    if (state is ProjectLoaded) {
      final currentState = state as ProjectLoaded;
      emit(currentState.copyWith(selectedTechStack: event.techStack));
    }
  }

  void _sortByDate(SortByDate event, Emitter<ProjectState> emit) {
    if (state is ProjectLoaded) {
      final currentState = state as ProjectLoaded;
      emit(currentState.copyWith(sortByDate: event.sortOrder));
    }
  }
}
