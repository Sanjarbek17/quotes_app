import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteService {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;

  QuoteService(this._dio, this._sharedPreferences);

  final String _favoriteKey = 'favorite';

  late final _qouteStreamController = BehaviorSubject<List<QuotesModel>>.seeded([]);
  late final _favoriteQuoteStreamController = BehaviorSubject<List<QuotesModel>>.seeded([]);
  late final _randomQuoteStreamController = BehaviorSubject<QuotesModel>.seeded(
    QuotesModel.empty(),
  );

  Stream<List<QuotesModel>> get quotesStream => _qouteStreamController.asBroadcastStream();
  Stream<List<QuotesModel>> get favoriteQuoteStream => _favoriteQuoteStreamController.asBroadcastStream();
  Stream<QuotesModel> get randomQuoteStream => _randomQuoteStreamController.asBroadcastStream();

  Future<void> getRandomQuote() async {
    final response = await _dio.get('quotes');

    if (response.data is List && response.data.isNotEmpty) {
      _randomQuoteStreamController.add(QuotesModel.fromJson(response.data[0]));
    } else {
      _randomQuoteStreamController.addError('Failed to load quotes');
    }
  }

  Future<void> getQuotes(String category, int limit) async {
    for (int i = 0; i < limit; i++) {
      final response = await _dio.get(
        'quotes',
        queryParameters: {'category': category},
      );
      if (response.data is List && response.data.isNotEmpty) {
        QuotesModel qouteModel = QuotesModel.fromJson(response.data[0]);
        if (!_favoriteQuoteStreamController.value.contains(qouteModel)) {
          qouteModel = qouteModel.copyWith(isFavorite: true);
        }
        _qouteStreamController.add(
          [
            ..._qouteStreamController.value,
            qouteModel,
          ],
        );
      } else {
        throw Exception('Failed to load quotes');
      }
    }
  }

  Future<void> getFavoriteQuotes() async {
    final favoriteQuotes = _sharedPreferences.getStringList(_favoriteKey) ?? [];
    final quotes = favoriteQuotes.map((quote) => QuotesModel.fromJson(jsonDecode(quote))).toList();
    _favoriteQuoteStreamController.add(quotes);
  }

  Future<void> addFavoriteQuote(QuotesModel quote) async {
    final favoriteQuotes = _sharedPreferences.getStringList(_favoriteKey) ?? [];
    favoriteQuotes.add(jsonEncode(quote.toJson()));
    await _sharedPreferences.setStringList(_favoriteKey, favoriteQuotes);
    _favoriteQuoteStreamController.add(favoriteQuotes.map((quote) => QuotesModel.fromJson(jsonDecode(quote))).toList());
  }

  Future<void> removeFavoriteQuote(QuotesModel quote) async {
    final favoriteQuotes = _sharedPreferences.getStringList(_favoriteKey) ?? [];
    favoriteQuotes.removeWhere((element) => element == jsonEncode(quote.toJson()));
    await _sharedPreferences.setStringList(_favoriteKey, favoriteQuotes);
    _favoriteQuoteStreamController.add(favoriteQuotes.map((quote) => QuotesModel.fromJson(jsonDecode(quote))).toList());
  }
}
