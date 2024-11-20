import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/data/model/quotes_model.dart';
import 'package:quotes_app/data/repository/quote_repository.dart';

part 'qoute_bloc_state.dart';
part 'qoute_bloc_event.dart';

class QouteBloc extends Bloc<QouteBlocEvent, QouteBlocState> {
  final QuoteRepository _quoteRepository;

  QouteBloc(this._quoteRepository) : super(QouteBlocState(qoutes: [])) {
    on<FetchQouteEvent>(_onFetchQouteEvent);
    on<InitialQouteEvent>(_onInitialQouteEvent);
  }

  void _onInitialQouteEvent(InitialQouteEvent event, Emitter<QouteBlocState> emit) async {
    await emit.forEach(
      _quoteRepository.quotesStream,
      onData: (data) => state.copyWith(state: QouteBlocStatus.loaded, qoutes: data),
      onError: (error, stackTrace) => state.copyWith(state: QouteBlocStatus.error),
    );
  }

  void _onFetchQouteEvent(FetchQouteEvent event, Emitter<QouteBlocState> emit) async {
    final response = await _quoteRepository.getQuotes(event.category);

    response.fold((failure) {
      emit(state.copyWith(state: QouteBlocStatus.error));
    }, (success) {});
  }
}
