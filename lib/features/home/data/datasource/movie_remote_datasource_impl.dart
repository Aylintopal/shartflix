import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/home/data/datasource/movie_remote_datasource.dart';
import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';

@LazySingleton(as: MovieRemoteDatasource)
class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final Dio dio;

  const MovieRemoteDatasourceImpl({required this.dio});

  @override
  Future<MoviePaginationModel> getPaginatedList({required int page}) async {
    try {
      final response = await dio.get(
        'movie/list',
        queryParameters: {'page': page},
      );
      return MoviePaginationModel.fromJson(response.data);
    } on DioException catch (e) {
      final code = e.response?.data.toString() ?? e.message ?? 'UNKNOWN';

      throw MovieFailure(
        message: code,
        code: e.response?.statusCode?.toString() ?? 'Response code null',
      );
    }
  }
}
