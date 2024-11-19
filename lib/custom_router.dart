import 'package:flutter/material.dart';
import 'package:quotes_app/pages/category_screen.dart';
import 'package:quotes_app/pages/home_screen.dart';
import 'package:quotes_app/pages/settings_screen.dart';
import 'package:quotes_app/pages/splash_screen.dart';

class CustomRouter {
  static const String home = '/home';
  static const String splashPage = '/splashPage';
  static const String categoryScreen = '/categoryScreen';
  static const String settingsScreen = 'settingsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case categoryScreen:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
