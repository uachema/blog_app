part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLogin extends AuthEvent {
  AuthLogin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

final class AuthSignup extends AuthEvent {
  AuthSignup({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
}
