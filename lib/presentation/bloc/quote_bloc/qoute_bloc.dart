import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:quotes_app/data/repository/quote_repository.dart';

part 'qoute_bloc_state.dart';
part 'qoute_bloc_event.dart';

class QouteBloc extends Bloc<QouteBlocEvent, QouteState> {
  final QuoteRepository _quoteRepository;

  QouteBloc(this._quoteRepository) : super(QouteState(qoutes: [])) {
    on<FetchQouteEvent>(_onFetchQouteEvent);
    on<InitialQouteEvent>(_onInitialQouteEvent);
  }

  void _onInitialQouteEvent(InitialQouteEvent event, Emitter<QouteState> emit) {
    _quoteRepository.quotesStream.listen((event) {
      emit(state.copyWith(qoutes: event));
    });
  }

  void _onFetchQouteEvent(FetchQouteEvent event, Emitter<QouteState> emit) async {
    emit(state.copyWith(state: QouteBlocState.loading));
    final response = await _quoteRepository.getQuotes(event.category);

    response.fold((failure) {
      emit(state.copyWith(state: QouteBlocState.error));
    }, (success) {});
  }
}
