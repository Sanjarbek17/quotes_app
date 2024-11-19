import 'package:dartz/dartz.dart';
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
    _repository.randomQuoteStream.listen((event) {
      emit(state.copyWith(quotesModel: event));
    });
  }

  void getQoute() async {
    emit(state.copyWith(state: RandomQouteBlocStatus.loading));
    final Either response = await _repository.getRandomQuote();

    response.fold(
      (failure) => emit(state.copyWith(state: RandomQouteBlocStatus.error)),
      (success) => null,
    );
  }
}