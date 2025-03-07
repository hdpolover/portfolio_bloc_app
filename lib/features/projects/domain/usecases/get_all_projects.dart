import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/project_repository.dart';
import '../entities/project.dart';

class GetAllProjects {
  final ProjectRepository repository;

  GetAllProjects(this.repository);

  Future<Either<Failure, List<Project>>> call() async {
    return await repository.getAllProjects();
  }
}
