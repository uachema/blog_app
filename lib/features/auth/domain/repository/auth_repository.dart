import 'package:blog_app/core/utils/result.dart';

abstract interface class AuthRepository {
  Future<Result> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Result> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
