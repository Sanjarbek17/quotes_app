import 'package:dio/dio.dart';
import 'package:quotes_app/data/model/quotes_model.dart';

class QuoteService {
  final Dio _dio;

  QuoteService(this._dio);

  Future<QuotesModel> getRandomQuote() async {
    final response = await _dio.get('quotes');

    if (response.data is List && response.data.isNotEmpty) {
      return QuotesModel.fromJson(response.data[0]);
    } else {
      throw Exception('Failed to load quote');
    }
  }

  Future<List<QuotesModel>> getQuotes(String category, [int limit = 10]) async {
    List<QuotesModel> quotes = [];
    for (int i = 0; i < limit; i++) {
      final response = await _dio.get(
        'quotes',
        queryParameters: {'category': category},
      );

      if (response.data is List && response.data.isNotEmpty) {
        quotes.add(QuotesModel.fromJson(response.data[0]));
      } else {
        throw Exception('Failed to load quotes');
      }
    }

    return quotes;
  }
}
