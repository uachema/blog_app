import 'package:blog_app/core/navigation/app_routes.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoute.login.path,
  routes: <GoRoute>[
    GoRoute(
      name: 'Login',
      path: AppRoute.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'Signup',
      path: AppRoute.signup.path,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      name: 'Blogs',
      path: AppRoute.blogs.path,
      builder: (context, state) => const Scaffold(),
    ),
  ],
);
