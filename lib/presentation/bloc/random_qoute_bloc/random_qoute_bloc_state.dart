part of 'random_qoute_bloc.dart';

enum RandomQouteBlocStatus {
  initial,
  loading,
  loaded,
  error,
}
class RandomQouteBlocState {
  final RandomQouteBlocStatus state;
  final QuotesModel? quotesModel;

  const RandomQouteBlocState({
    this.state = RandomQouteBlocStatus.initial,
    this.quotesModel,
  });

  RandomQouteBlocState copyWith({
    RandomQouteBlocStatus? state,
    QuotesModel? quotesModel,
  }) {
    return RandomQouteBlocState(
      state: state ?? this.state,
      quotesModel: quotesModel ?? this.quotesModel,
    );
  }
}