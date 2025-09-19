import 'package:dartz/dartz.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/core/models/user_model.dart';

abstract class ProfileRepository {
  Future<Either<AppFailure, UserModel>> getUser();
  Future<Either<AppFailure, List<MovieModel>?>> getFavorites();
  Future<Either<AppFailure, Map<String, dynamic>>> setFavorites({
    required String favoriteId,
  });
}
