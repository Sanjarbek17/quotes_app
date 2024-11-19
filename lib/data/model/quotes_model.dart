import 'package:equatable/equatable.dart';

class QuotesModel extends Equatable {
  final String quote;
  final String author;

  const QuotesModel({
    required this.quote,
    required this.author,
  });

  @override
  List<Object?> get props => [quote, author];

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      quote: json['quote'] ?? '',
      author: json['author'] ?? '',
    );
  }
}
