import 'package:fpdart/fpdart.dart';
import 'package:portofolio_bloc_app/core/network/connection_checker.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/data/datasources/project_remote_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final SupabaseClient supabase;
  final ProjectRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  ProjectRepositoryImpl({
    required this.supabase,
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, List<Project>>> getAllProjects() async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(ConnectionFailure('No internet connection'));
      }

      final response = await remoteDataSource.getAllProjects();

      if (response.isEmpty) {
        return const Right([]);
      }

      final projects = response.map((project) {
        return Project(
          id: project.id,
          title: project.title,
          description: project.description,
          githubLink: project.githubLink,
          liveDemoLink: project.liveDemoLink,
          techStack: project.techStack,
          images: project.images,
        );
      }).toList();

      return Right(projects);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addProject(Project project) async {
    try {
      final response = await supabase.from('projects').insert({
        'title': project.title,
        'description': project.description,
        'github_link': project.githubLink,
        'live_demo_link': project.liveDemoLink,
        'tech_stack': project.techStack,
      });

      // Handle image uploads if any
      if (project.images.isNotEmpty) {
        for (var image in project.images) {
          await supabase.from('project_images').insert({
            'project_id': response['id'],
            'image_url': image,
          });
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) async {
    try {
      await supabase.from('projects').delete().eq('id', projectId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) async {
    try {
      await supabase.from('projects').update({
        'title': project.title,
        'description': project.description,
        'github_link': project.githubLink,
        'live_demo_link': project.liveDemoLink,
        'tech_stack': project.techStack,
      }).eq('id', project.id);

      // Handle image updates if any
      if (project.images.isNotEmpty) {
        for (var image in project.images) {
          await supabase.from('project_images').insert({
            'project_id': project.id,
            'image_url': image,
          });
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
