import 'package:equatable/equatable.dart';
import 'package:shartflix/core/models/movie_model.dart';

abstract class FavoriteState extends Equatable {}



class FavoriteInitial extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteLoaded extends FavoriteState {
  final List<MovieModel>? favorites;

  FavoriteLoaded({required this.favorites});
  @override
  List<Object?> get props => [favorites];
}

class FavoriteAdded extends FavoriteState {
  final String message;

  FavoriteAdded({required this.message});
  @override
  List<Object?> get props => [message];
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError({required this.message});

  @override
  List<Object?> get props => [message];
}
