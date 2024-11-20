import 'package:flutter/material.dart';
import 'package:quotes_app/app_view.dart';
import 'package:quotes_app/presentation/pages/category_screen.dart';
import 'package:quotes_app/presentation/pages/home_screen.dart';
import 'package:quotes_app/presentation/pages/settings_screen.dart';
import 'package:quotes_app/presentation/pages/splash_screen.dart';

class CustomRouter {
  static const String home = '/home';
  static const String splashPage = '/splashPage';
  static const String appView = '/appView';
  static const String categoryScreen = '/categoryScreen';
  static const String settingsScreen = 'settingsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case categoryScreen:
        return MaterialPageRoute(
          builder: (_) {
            final Map arguments = settings.arguments as Map;
            return CategoryScreen(
              category: arguments['category'],
              color: arguments['color'],
            );
          },
        );
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case appView:
        return MaterialPageRoute(builder: (_) => const AppView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
