import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/project_repository.dart';
import '../entities/project.dart';

class AddProject {
  final ProjectRepository repository;

  AddProject(this.repository);

  Future<Either<Failure, void>> call(Project project) async {
    return await repository.addProject(project);
  }
}
