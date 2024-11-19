part of 'favorite_bloc.dart';

abstract class FavoriteBlocEvent extends Equatable {
  const FavoriteBlocEvent();

  @override
  List<Object> get props => [];
}
class InitialFavoriteQuotes extends FavoriteBlocEvent {}

class GetFavoriteQuotes extends FavoriteBlocEvent {}

class AddFavoriteQuotes extends FavoriteBlocEvent {
  final QuotesModel quotesModel;

  const AddFavoriteQuotes(this.quotesModel);

  @override
  List<Object> get props => [quotesModel];
}

class RemoveFavoriteQuotes extends FavoriteBlocEvent {
  final QuotesModel quotesModel;

  const RemoveFavoriteQuotes(this.quotesModel);

  @override
  List<Object> get props => [quotesModel];
}