import 'package:shartflix/features/home/data/models/movie_model.dart';

class MoviePaginationModel {
  final List<MovieModel> movies;
  final int totalPages;
  final int currentPage;

  const MoviePaginationModel({
    required this.movies,
    required this.totalPages,
    required this.currentPage,
  });

  factory MoviePaginationModel.fromJson(Map<String, dynamic> json) {
    final moviesJson = (json['data']?['movies'] as List<dynamic>?) ?? [];
    return MoviePaginationModel(
      movies: moviesJson
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['data']?['pagination']?['maxPage'] ?? 0,
      currentPage: json['data']?['pagination']?['currentPage'] ?? 0,
    );
  }
}
