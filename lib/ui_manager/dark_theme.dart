import 'package:flutter/material.dart';
import 'package:picto/constants/fixed_numbers.dart';

import '../constants/fixed_colors.dart';

ThemeData darkThemeData = ThemeData.dark().copyWith(
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: const Color.fromARGB(255, 1, 15, 20),
  shadowColor: Colors.white.withOpacity(0.2),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  //We used cardColor as same color as the theme
  cardColor: const Color(0xff021821),
  //We used focusColor as inversed color of the theme
  focusColor: whiteColor,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff021821), elevation: 0, centerTitle: false),
  inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: const Color(0xff021821),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fixedBorderRadius),
          borderSide: BorderSide.none)),
);
