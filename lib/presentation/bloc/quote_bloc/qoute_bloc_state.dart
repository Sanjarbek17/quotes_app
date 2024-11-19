part of 'qoute_bloc.dart';

enum QouteBlocState {
  initial,
  loading,
  loaded,
  error,
}

class QouteState {
  final QouteBlocState state;
  final List<QuotesModel> qoutes;

  QouteState({
    this.state = QouteBlocState.initial,
    required this.qoutes,
  });

  QouteState copyWith({
    QouteBlocState? state,
    List<QuotesModel>? qoutes,
  }) {
    return QouteState(
      state: state ?? this.state,
      qoutes: qoutes ?? this.qoutes,
    );
  }
}
