import 'package:bloc/bloc.dart';
import 'package:blog_app/core/utils/result.dart';
import 'package:blog_app/features/auth/domain/usercases/user_signup.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required UserSignup userSignup,
  })  : _userSignup = userSignup,
        super(AuthInitial()) {
    on<AuthLogin>((event, emit) {});

    on<AuthSignup>((event, emit) async {
      final result = await _userSignup(
        UserSignupPrams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      final _ = switch (result) {
        Success() => emit(AuthSuccess(result.data)),
        Failure() => emit(AuthFailure(result.message)),
      };
    });
  }

  final UserSignup _userSignup;
}
