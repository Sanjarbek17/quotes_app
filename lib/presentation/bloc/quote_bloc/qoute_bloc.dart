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

  void _onInitialQouteEvent(InitialQouteEvent event, Emitter<QouteBlocState> emit) {
    _quoteRepository.quotesStream.listen((event) {
      emit(state.copyWith(qoutes: event));
    });
  }

  void _onFetchQouteEvent(FetchQouteEvent event, Emitter<QouteBlocState> emit) async {
    emit(state.copyWith(state: QouteBlocStatus.loading));
    final response = await _quoteRepository.getQuotes(event.category);

    response.fold((failure) {
      emit(state.copyWith(state: QouteBlocStatus.error));
    }, (success) {});
  }
}
