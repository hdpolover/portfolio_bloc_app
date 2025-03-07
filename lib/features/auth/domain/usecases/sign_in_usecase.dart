import 'package:fpdart/fpdart.dart';
import 'package:portofolio_bloc_app/core/errors/failures.dart';
import 'package:portofolio_bloc_app/core/usecases/usecase.dart';
import 'package:portofolio_bloc_app/features/auth/domain/repositories/auth_repository.dart';

import '../entities/admin_user.dart';

class SignInUsecase implements UseCase<AdminUser, SignInParams> {
  AuthRepository repository;
  SignInUsecase(this.repository);

  @override
  Future<Either<Failure, AdminUser>> call(SignInParams params) {
    return repository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
