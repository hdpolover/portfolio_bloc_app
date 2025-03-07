import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/project.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getAllProjects();

  Future<Either<Failure, void>> addProject(Project project);
  Future<Either<Failure, void>> updateProject(Project project);
  Future<Either<Failure, void>> deleteProject(String projectId);
}
