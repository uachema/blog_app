part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  const AuthSuccess(this.uid);

  final String uid;
}

final class AuthFailure extends AuthState {
  const AuthFailure(this.message);

  final String message;
}
