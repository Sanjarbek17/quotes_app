import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quotes_app/core/custom_theme.dart';
import 'package:quotes_app/custom_router.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      onGenerateRoute: CustomRouter.generateRoute,
      initialRoute: CustomRouter.appView,
    );
  }
}
