part of 'qoute_bloc.dart';

enum QouteBlocStatus {
  initial,
  loading,
  loaded,
  error,
}

class QouteBlocState {
  final QouteBlocStatus state;
  final List<QuotesModel> qoutes;

  QouteBlocState({
    this.state = QouteBlocStatus.initial,
    required this.qoutes,
  });

  QouteBlocState copyWith({
    QouteBlocStatus? state,
    List<QuotesModel>? qoutes,
  }) {
    return QouteBlocState(
      state: state ?? this.state,
      qoutes: qoutes ?? this.qoutes,
    );
  }
}
