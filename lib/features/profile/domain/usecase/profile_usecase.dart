import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/core/models/user_model.dart';
import 'package:shartflix/features/profile/domain/repositories/profile_repository.dart';

@injectable
class ProfileUsecase {
  final ProfileRepository repository;

  ProfileUsecase({required this.repository});

  Future<Either<AppFailure, UserModel>> getUser() => repository.getUser();
  Future<Either<AppFailure, List<MovieModel>?>> getFavorites() =>
      repository.getFavorites();

  Future<Either<AppFailure, Map<String, dynamic>>> setFavorites({
    required String favoriteId,
  }) => repository.setFavorites(favoriteId: favoriteId);
}
