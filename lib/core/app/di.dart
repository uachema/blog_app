import 'package:blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/data_sources/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/usercases/user_signup.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DI extends StatelessWidget {
  const DI({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _DataSourceDI(
      child: _RepositoryDI(
        child: _UseCaseDI(
          child: _BlocDI(
            child: child,
          ),
        ),
      ),
    );
  }
}

class _DataSourceDI extends StatelessWidget {
  const _DataSourceDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final supabaseClient = Supabase.instance.client;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRemoteDataSourceImpl(supabaseClient),
        )
      ],
      child: child,
    );
  }
}

class _RepositoryDI extends StatelessWidget {
  const _RepositoryDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositoryImpl(
            context.read<AuthRemoteDataSourceImpl>(),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _UseCaseDI extends StatelessWidget {
  const _UseCaseDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserSignup(
            context.read<AuthRepositoryImpl>(),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _BlocDI extends StatelessWidget {
  const _BlocDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            userSignup: context.read<UserSignup>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
