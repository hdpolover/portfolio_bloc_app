import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/data/models/project_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getAllProjects();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final SupabaseClient supabaseClient;
  ProjectRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ProjectModel>> getAllProjects() async {
    try {
      LoggerService.logInfo('Fetching projects from Supabase...');

      // Improved query with explicit columns
      final response = await supabaseClient
          .from('projects')
          .select('*')
          .order('created_at', ascending: false);

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
}
