import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';
import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/features/home/domain/usecases/movie_usecase.dart';
import 'package:shartflix/features/home/presentation/cubit/movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  final MovieUsecase movieUsecase;
  MovieCubit({required this.movieUsecase}) : super(MovieInitial());

  Future<void> getMovieList({required int page}) async {
    if (page == 1) {
      emit(MovieLoading());
    }

    final Either<AppFailure, MoviePaginationModel> response =
        await movieUsecase.getMovieList(page: page);

    response.fold((failure) => emit(MovieError(message: failure.message)), (
      movieListModel,
    ) {
      List<MovieModel> allMovies = [];

      if (state is MovieLoaded && page != 1) {
        final oldList = (state as MovieLoaded).movieList.movies;
        allMovies = [...oldList, ...movieListModel.movies];
      } else {
        allMovies = movieListModel.movies;
      }

      final newMovieListModel = MoviePaginationModel(
        movies: allMovies,
        currentPage: movieListModel.currentPage,
        totalPages: movieListModel.totalPages,
      );

      emit(MovieLoaded(movieList: newMovieListModel));
    });
  }
}
