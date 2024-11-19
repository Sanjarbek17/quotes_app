import 'package:dartz/dartz.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:quotes_app/data/service/quote_service.dart';
import 'package:quotes_app/utils/custom_failure.dart';
import 'package:quotes_app/utils/custom_success.dart';

class QuoteRepository {
  final QuoteService _quoteService;

  QuoteRepository(this._quoteService);

  Stream<List<QuotesModel>> get quotesStream => _quoteService.quotesStream;
  Stream<List<QuotesModel>> get favoriteQuotesStream => _quoteService.favoriteQuoteStream;
  Stream<QuotesModel> get randomQuoteStream => _quoteService.randomQuoteStream;

  Future<void> getRandomQuote() async {
    await _quoteService.getRandomQuote();
  }

  Future<Either<Failure, Success>> getQuotes(String category, [int limit = 10]) async {
    try {
      await _quoteService.getQuotes(category, limit);
      return Right(Success());
    } catch (e) {
      return Left(Failure('Failed to load quotes'));
    }
  }

  Future<Either<Failure, Success>> getFavoriteQuotes() async {
    try {
      await _quoteService.getFavoriteQuotes();
      return Right(Success());
    } catch (e) {
      return Left(Failure('Failed to load favorite quotes'));
    }
  }

  Future<Either<Failure, Success>> addFavoriteQuote(QuotesModel quote) async {
    try {
      await _quoteService.addFavoriteQuote(quote);
      return Right(Success());
    } catch (e) {
      return Left(Failure('Failed to add favorite quote'));
    }
  }

  Future<Either<Failure, Success>> removeFavoriteQuote(QuotesModel quote) async {
    try {
      await _quoteService.removeFavoriteQuote(quote);
      return Right(Success());
    } catch (e) {
      return Left(Failure('Failed to remove favorite quote'));
    }
  }
}