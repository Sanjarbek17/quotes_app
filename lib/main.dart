import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quotes_app/core/custom_theme.dart';
import 'package:quotes_app/custom_router.dart';
import 'package:quotes_app/dependency_injection.dart';
import 'package:quotes_app/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:quotes_app/presentation/bloc/quote_bloc/qoute_bloc.dart';
import 'package:quotes_app/presentation/bloc/random_qoute_bloc/random_qoute_bloc.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return locator<RandomQouteBloc>()..init();
          },
        ),
        BlocProvider(
          create: (context) => locator<QouteBloc>()..add(InitialQouteEvent()),
        ),
        BlocProvider(
          create: (context) => locator<FavoriteBloc>()..add((InitialFavoriteQuotes())),
        ),
      ],
      child: const MyApp(),
    );
  }
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
