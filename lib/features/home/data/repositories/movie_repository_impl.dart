import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/home/data/datasource/movie_remote_datasource.dart';
import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';
import 'package:shartflix/features/home/domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource movieDatasource;
  const MovieRepositoryImpl({required this.movieDatasource});

  @override
  Future<Either<AppFailure, MoviePaginationModel>> getMovieList({
    required int page,
  }) async {
    try {
      final MoviePaginationModel response = await movieDatasource
          .getPaginatedList(page: page);
      return Right(response);
    } on MovieFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(MovieFailure(message: 'Movie Error', code: e.toString()));
    }
  }
}
