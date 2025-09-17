import 'package:equatable/equatable.dart';
import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';

abstract class MovieState extends Equatable {}

class MovieInitial extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoaded extends MovieState {
  final MoviePaginationModel movieList;
  MovieLoaded({required this.movieList});

  @override
  List<Object?> get props => [movieList];
}

class MovieError extends MovieState {
  final String message;
  MovieError({required this.message});

  @override
  List<Object?> get props => [message];
}
