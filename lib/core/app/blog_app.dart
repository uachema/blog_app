import 'package:blog_app/core/app/di.dart';
import 'package:blog_app/core/app/theme.dart';
import 'package:blog_app/core/constants/constants.dart';
import 'package:blog_app/core/navigation/app_pages.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DI(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: appTheme,
        routerConfig: router,
      ),
    );
  }
}
