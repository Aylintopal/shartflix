import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/core/models/user_model.dart';
import 'package:shartflix/features/profile/data/datasource/profile_remote_datasource.dart';

@LazySingleton(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final Dio dio;

  ProfileRemoteDatasourceImpl({required this.dio});

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await dio.get('user/profile');

      final user = UserModel.fromJson(response.data['data']);

      return user;
    } on DioException catch (e) {
      final code = e.response?.data['response']['message'] ?? 'UNKNOWN';
      throw UserFailure(code: code, message: code);
    }
  }

  @override
  Future<List<MovieModel>?> getFavorites() async {
    try {
      final response = await dio.get('movie/favorites');
      final data = response.data['data'];

      if (data != null && data is List && data.isNotEmpty) {
        return data.map((e) => MovieModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      final code = e.response?.data.toString() ?? e.message ?? 'UNKNOWN';
      throw FavoriteFailure(
        message: code,
        code: e.response?.statusCode?.toString() ?? 'Response code null',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> setFavorites({
    required String favoriteId,
  }) async {
    try {
      final response = await dio.post('movie/favorite/$favoriteId');
      return response.data;
    } on DioException catch (e) {
      final code = e.response?.data.toString() ?? e.message ?? 'UNKNOWN';
      throw FavoriteFailure(
        message: code,
        code: e.response?.statusCode?.toString() ?? 'Response code null',
      );
    }
  }
}
