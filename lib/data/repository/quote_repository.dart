import 'package:dartz/dartz.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:quotes_app/data/service/quote_service.dart';
import 'package:quotes_app/utils/custom_failure.dart';

class QuoteRepository {
  final QuoteService _quoteService;

  QuoteRepository(this._quoteService);

  Future<Either<Failure, QuotesModel> > getRandomQuote() async {
    try {
      final quote = await _quoteService.getRandomQuote();
      return Right(quote);
    } catch (e) {
      return Left(Failure('Failed to load quote'));
    }
  }

  Future<Either<Failure, List<QuotesModel>>> getQuotes(String category, [int limit = 10]) async {
    try {
      final quotes = await _quoteService.getQuotes(category, limit);
      return Right(quotes);
    } catch (e) {
      return Left(Failure('Failed to load quotes'));
    }
  }
}