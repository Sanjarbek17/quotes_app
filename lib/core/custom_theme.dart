import 'package:flutter/material.dart';
import 'package:quotes_app/core/custom_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.purple,
  scaffoldBackgroundColor: CustomColors.primaryColor,
  textTheme: lightTextTheme,
  colorScheme: lightColorScheme,
);

const lightTextTheme = TextTheme();

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: CustomColors.primaryColor,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  textTheme: darkTextTheme,
  colorScheme: darkColorScheme,
);

const darkTextTheme = TextTheme();

const darkColorScheme = ColorScheme.dark();
