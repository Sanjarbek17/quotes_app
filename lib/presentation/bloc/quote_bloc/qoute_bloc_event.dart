part of 'qoute_bloc.dart';

abstract class QouteBlocEvent extends Equatable {
  const QouteBlocEvent();

  @override
  List<Object> get props => [];
}

class InitialQouteEvent extends QouteBlocEvent {}

class FetchQouteEvent extends QouteBlocEvent {
  final String category;

  const FetchQouteEvent(this.category);
}