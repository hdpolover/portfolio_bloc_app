import 'package:fpdart/fpdart.dart';
import 'package:portofolio_bloc_app/core/errors/failures.dart';
import 'package:portofolio_bloc_app/core/network/connection_checker.dart';
import 'package:portofolio_bloc_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:portofolio_bloc_app/features/auth/domain/entities/admin_user.dart';
import 'package:portofolio_bloc_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  ConnectionChecker connectionChecker;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, AdminUser>> signIn(
      {required String email, required String password}) async {
    try {
      if (!await connectionChecker.isConnected) {
        return Left(ConnectionFailure('No internet connection'));
      }

      return remoteDataSource.signIn(email: email, password: password).then(
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }
}
