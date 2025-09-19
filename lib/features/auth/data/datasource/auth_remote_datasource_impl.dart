import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:shartflix/features/auth/data/model/auth_response_model.dart';

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;
  const AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'user/login',
        data: {'email': email, 'password': password},
      );

      final data = AuthResponseModel.fromJson(response.data['data']);
      return data;
    } on DioException catch (e) {
      final code = e.response?.data['response']['message'] ?? 'UNKNOWN';
      throw AuthFailure(code: code, message: code);
    }
  }

  @override
  Future<AuthResponseModel> register({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'user/register',
        data: {'email': email, 'name': name, 'password': password},
      );

      final data = AuthResponseModel.fromJson(response.data['data']);
      return data;
    } on DioException catch (e) {
      final code = e.response?.data['response']['message'] ?? 'UNKNOWN';
      throw AuthFailure(code: code, message: code);
    }
  }
}
