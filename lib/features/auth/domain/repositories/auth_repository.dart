import 'package:fpdart/fpdart.dart';
import 'package:portofolio_bloc_app/core/errors/failures.dart';
import 'package:portofolio_bloc_app/features/auth/domain/entities/admin_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AdminUser>> signIn({
    required String email,
    required String password,
  });
}
