import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/utils/result.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<UserLoginPrams> {
  const UserLogin(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Result> call(UserLoginPrams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginPrams {
  UserLoginPrams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
