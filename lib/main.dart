import 'package:flutter/material.dart';
import 'package:quotes_app/core/custom_theme.dart';
import 'package:quotes_app/custom_router.dart';

void main() {
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
      initialRoute: CustomRouter.splashPage,
    );
  }
}
