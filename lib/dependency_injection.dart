import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes_app/data/repository/quote_repository.dart';
import 'package:quotes_app/data/service/quote_service.dart';
import 'package:quotes_app/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:quotes_app/presentation/bloc/quote_bloc/qoute_bloc.dart';
import 'package:quotes_app/presentation/bloc/random_qoute_bloc/random_qoute_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  String token = dotenv.env['token']!;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.api-ninjas.com/v1/',
    headers: {
      'X-Api-Key': token,
    },
  ));

  locator.registerSingleton<SharedPreferences>(prefs);
  locator.registerSingleton<Dio>(dio);

  // Registering the service
  locator.registerLazySingleton<QuoteService>(
    () => QuoteService(
      locator<Dio>(),
      locator<SharedPreferences>(),
    ),
  );

  // Registering the repository
  locator.registerLazySingleton<QuoteRepository>(
    () => QuoteRepository(
      locator<QuoteService>(),
    ),
  );

  // Registering the bloc
  locator.registerLazySingleton<RandomQouteBloc>(
    () => RandomQouteBloc(
      locator<QuoteRepository>(),
    ),
  );
  locator.registerLazySingleton<QouteBloc>(
    () => QouteBloc(
      locator<QuoteRepository>(),
    ),
  );
  locator.registerLazySingleton<FavoriteBloc>(
    () => FavoriteBloc(
      locator<QuoteRepository>(),
    ),
  );
}
