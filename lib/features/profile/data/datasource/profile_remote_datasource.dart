import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/core/models/user_model.dart';

abstract class ProfileRemoteDatasource {
  Future<UserModel> getUser();
  Future<List<MovieModel>?> getFavorites();
  Future<Map<String, dynamic>> setFavorites({required String favoriteId});
}
