import 'package:blog_app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackgroundColor,
  ),
  chipTheme: const ChipThemeData(
    color: MaterialStatePropertyAll(
      kBackgroundColor,
    ),
    side: BorderSide.none,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(27),
    border: _border(),
    enabledBorder: _border(),
    focusedBorder: _border(kGradient2),
    errorBorder: _border(kErrorColor),
  ),
);

InputBorder _border([Color color = kBorderColor]) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(10),
    );
