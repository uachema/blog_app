import 'package:blog_app/core/app/blog_app.dart';
import 'package:blog_app/core/constants/secrets.dart';
import 'package:blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/data_sources/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/usercases/user_signup.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignup: UserSignup(
              AuthRepositoryImpl(
                AuthRemoteDataSourceImpl(
                  supabase.client,
                ),
              ),
            ),
          ),
        ),
      ],
      child: const BlogApp(),
    ),
  );
}

abstract interface class Auth {
  Future<bool> login();
}

class LoginPage implements Auth {
  @override
  Future<bool> login() async {
    return false;
  }
}
