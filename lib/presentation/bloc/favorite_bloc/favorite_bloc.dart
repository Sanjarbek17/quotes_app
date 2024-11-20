import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:quotes_app/data/repository/quote_repository.dart';

part 'qoute_bloc_state.dart';
part 'qoute_bloc_event.dart';

class FavoriteBloc extends Bloc<FavoriteBlocEvent, FavoriteBlocState> {
  final QuoteRepository quoteRepository;
  FavoriteBloc(this.quoteRepository) : super(FavoriteBlocState(favorites: [])) {
    on<InitialFavoriteQuotes>(_initialFavoriteQuotes);
    on<GetFavoriteQuotes>(_getFavoriteQuotes);
    on<AddFavoriteQuotes>(_addFavoriteQuotes);
    on<RemoveFavoriteQuotes>(_removeFavoriteQuotes);
  }

  void _initialFavoriteQuotes(InitialFavoriteQuotes event, Emitter<FavoriteBlocState> emit) async {
    emit(state.copyWith(status: FavoriteBlocStatus.loading));
    await quoteRepository.getFavoriteQuotes();
    await emit.forEach(
      quoteRepository.favoriteQuotesStream,
      onData: (data) => state.copyWith(status: FavoriteBlocStatus.loaded, favorites: data),
      onError: (error, stackTrace) => state.copyWith(status: FavoriteBlocStatus.error),
    );
  }

  void _getFavoriteQuotes(GetFavoriteQuotes event, Emitter<FavoriteBlocState> emit) async {
    emit(state.copyWith(status: FavoriteBlocStatus.loading));
    final favorites = await quoteRepository.getFavoriteQuotes();
    favorites.fold(
      (l) => emit(state.copyWith(status: FavoriteBlocStatus.error)),
      (r) {},
    );
  }

  void _addFavoriteQuotes(AddFavoriteQuotes event, Emitter<FavoriteBlocState> emit) async {
    emit(state.copyWith(status: FavoriteBlocStatus.loading));
    final response = await quoteRepository.addFavoriteQuote(event.quotesModel);
    response.fold(
      (l) => emit(state.copyWith(status: FavoriteBlocStatus.error)),
      (r) {},
    );
  }

  void _removeFavoriteQuotes(RemoveFavoriteQuotes event, Emitter<FavoriteBlocState> emit) async {
    emit(state.copyWith(status: FavoriteBlocStatus.loading));
    final response = await quoteRepository.removeFavoriteQuote(event.quotesModel);
    response.fold(
      (l) => emit(state.copyWith(status: FavoriteBlocStatus.error)),
      (r) {},
    );
  }
}
