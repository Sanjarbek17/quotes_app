import 'package:equatable/equatable.dart';

class QuotesModel extends Equatable {
  final String quote;
  final String? author;
  final bool isFavorite;

  const QuotesModel({
    required this.quote,
    required this.author,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [quote, author];

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      quote: json['quote'] ?? '',
      author: json['author'] ?? '',
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quote': quote,
      'author': author,
      'is_favorite': isFavorite,
    };
  }

  QuotesModel copyWith({
    String? quote,
    String? author,
    bool? isFavorite,
  }) {
    return QuotesModel(
      quote: quote ?? this.quote,
      author: author ?? this.author,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  static QuotesModel empty() {
    return const QuotesModel(quote: '', author: '');
  }
}
