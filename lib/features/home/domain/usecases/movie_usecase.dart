import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/auth_failure.dart';
import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';
import 'package:shartflix/features/home/domain/repositories/movie_repository.dart';

@injectable
class MovieUsecase {
  final MovieRepository movieRepository;
  MovieUsecase({required this.movieRepository});

  Future<Either<MovieFailure, MoviePaginationModel>> getMovieList({
    required int page,
  }) => movieRepository.getMovieList(page: page);
}
