import 'package:dartz/dartz.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';

abstract class MovieRepository {
  Future<Either<AppFailure, MoviePaginationModel>> getMovieList({
    required int page,
  });
}
