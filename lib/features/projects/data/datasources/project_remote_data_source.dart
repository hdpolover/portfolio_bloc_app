import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/features/projects/data/models/project_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getAllProjects();

  Future<void> addProject(ProjectModel project);

  Future<void> updateProject(ProjectModel project);

  Future<void> deleteProject(String projectId);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProjectRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ProjectModel>> getAllProjects() async {
    try {
      LoggerService.logInfo('Fetching projects from Supabase...');

      final response = await supabaseClient.from('projects').select('''
        *,
        project_images!inner (
          *
        ),
        project_techs!inner (
          *
        )
          ''');

      LoggerService.logInfo('Supabase response: ${response.toString()}');

      LoggerService.logInfo(
          'Received response from Supabase: ${response.length} items');

      final projects = response
          .map((project) {
            try {
              return ProjectModel.fromJson(project);
            } catch (e) {
              LoggerService.logError('Error parsing project: $e');
              LoggerService.logError('Project data: $project');
              return null;
            }
          })
          .whereType<ProjectModel>()
          .toList();

      LoggerService.logInfo('Successfully parsed ${projects.length} projects');
      return projects;
    } catch (e, stackTrace) {
      LoggerService.logError('Error in getAllProjects: $e');
      LoggerService.logError(stackTrace.toString());
      rethrow;
    }
  }

  @override
  Future<void> addProject(ProjectModel project) {
    // TODO: implement addProject
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject(String projectId) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(ProjectModel project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}
