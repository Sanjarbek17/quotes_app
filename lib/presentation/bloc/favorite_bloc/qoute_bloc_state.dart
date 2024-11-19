part of 'favorite_bloc.dart';

enum FavoriteBlocStatus {
  initial,
  loading,
  loaded,
  error,
}

class FavoriteBlocState {
  final FavoriteBlocStatus status;
  final List<QuotesModel> favorites;

  FavoriteBlocState({
    this.status = FavoriteBlocStatus.initial,
    required this.favorites,
  });

  FavoriteBlocState copyWith({
    FavoriteBlocStatus? status,
    List<QuotesModel>? favorites,
  }) {
    return FavoriteBlocState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }
}