import 'package:flutter/material.dart';
import 'package:quotes_app/core/custom_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.purple,
  scaffoldBackgroundColor: Colors.white,
  textTheme: lightTextTheme,
  colorScheme: lightColorScheme,
);

final lightTextTheme = TextTheme(
  headlineSmall: const TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontFamily: 'Coming Soon',
  ),
  titleLarge: TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.8),
        offset: const Offset(-1, 5),
        blurRadius: 10,
      ),
    ],
  ),
  titleMedium: const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: 'Coming Soon',
  ),
);

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
