import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/core/models/user_model.dart';
import 'package:shartflix/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:shartflix/features/profile/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource datasource;

  ProfileRepositoryImpl({required this.datasource});

  @override
  Future<Either<AppFailure, UserModel>> getUser() async {
    try {
      final user = await datasource.getUser();
      return Right(user);
    } on UserFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UserFailure(message: e.toString(), code: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<MovieModel>?>> getFavorites() async {
    try {
      final List<MovieModel>? favorites = await datasource.getFavorites();

      return Right(favorites);
    } on MovieFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        MovieFailure(message: 'Favorites Movie Error', code: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppFailure, Map<String, dynamic>>> setFavorites({
    required String favoriteId,
  }) async {
    try {
      final Map<String, dynamic> response = await datasource.setFavorites(
        favoriteId: favoriteId,
      );

      return Right(response);
    } on FavoriteFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        FavoriteFailure(message: 'Favorite set Error', code: e.toString()),
      );
    }
  }
}
