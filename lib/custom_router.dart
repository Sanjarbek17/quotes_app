import 'package:flutter/material.dart';
import 'package:quotes_app/pages/splash_screen.dart';

class CustomRouter {
  static const String home = '/';
  static const String splashPage = '/splashPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
