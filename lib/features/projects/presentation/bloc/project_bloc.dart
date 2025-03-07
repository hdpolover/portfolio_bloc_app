import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';

import '../../domain/usecases/get_all_projects.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjects getAllProjects;

  ProjectBloc({required this.getAllProjects}) : super(ProjectInitial()) {
    on<LoadProjects>((event, emit) async {
      try {
        LoggerService.logInfo('ProjectBloc: Loading projects...');
        emit(ProjectLoading());

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
            emit(ProjectLoaded(projects));
          },
        );
      } catch (e, stackTrace) {
        LoggerService.logError('ProjectBloc: Exception occurred: $e');
        LoggerService.logError(stackTrace.toString());
        emit(ProjectError('An unexpected error occurred: $e'));
      }
    });
  }
}
