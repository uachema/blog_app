import 'package:blog_app/core/errors/server_exception.dart';
import 'package:blog_app/core/utils/result.dart';
import 'package:blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Result> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userID = await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return Success<String>(userID);
    } on ServerException catch (e) {
      return Failure(e.message);
    }
  }

  @override
  Future<Result> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userID = await remoteDataSource.signupWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return Success<String>(userID);
    } on ServerException catch (e) {
      return Failure(e.message);
    }
  }
}
