import 'package:fpdart/fpdart.dart';
import 'package:portofolio_bloc_app/core/network/connection_checker.dart';
import 'package:portofolio_bloc_app/features/projects/data/datasources/project_remote_data_source.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  ProjectRepositoryImpl({
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
    throw UnimplementedError('addProject is not implemented yet');
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) async {
    throw UnimplementedError('deleteProject is not implemented yet');
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) async {
    throw UnimplementedError('updateProject is not implemented yet');
  }
}
