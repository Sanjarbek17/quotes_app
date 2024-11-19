import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:quotes_app/data/repository/quote_repository.dart';

part 'random_qoute_bloc_state.dart';

class RandomQouteBloc extends Cubit<RandomQouteBlocState> {
  final QuoteRepository _repository;

  RandomQouteBloc(this._repository)
      : super(
          const RandomQouteBlocState(),
        );

  void init() {
    _repository.getRandomQuote();
    emit(state.copyWith(state: RandomQouteBlocStatus.loading));
    _repository.randomQuoteStream.listen(
      (event) {
        emit(state.copyWith(quotesModel: event, state: RandomQouteBlocStatus.loaded));
      },
      onError: (e) {
        emit(state.copyWith(state: RandomQouteBlocStatus.error));
      },
    );
  }

  void getQoute() async {
    emit(state.copyWith(state: RandomQouteBlocStatus.loading));
    await _repository.getRandomQuote();
  }
}
