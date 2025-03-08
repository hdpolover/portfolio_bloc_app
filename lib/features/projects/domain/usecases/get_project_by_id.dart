import 'package:fpdart/fpdart.dart';
import 'package:portofolio_bloc_app/core/errors/failures.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';
import 'package:portofolio_bloc_app/features/projects/domain/repositories/project_repository.dart';

class GetProjectById {
  final ProjectRepository projectRepository;

  GetProjectById(this.projectRepository);

  Future<Either<Failure, Project>> call(String id) async {
    return await projectRepository.getProjectById(id);
  }
}
