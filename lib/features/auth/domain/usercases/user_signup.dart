import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/utils/result.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';

class UserSignup implements UseCase<UserSignupPrams> {
  const UserSignup(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Result> call(UserSignupPrams params) async {
    return await authRepository.signupWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignupPrams {
  UserSignupPrams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String email;
  final String name;
  final String password;
}
