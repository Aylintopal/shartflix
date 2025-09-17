import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shartflix/core/failure/auth_failure.dart';
import 'package:shartflix/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:shartflix/features/auth/data/model/auth_response_model.dart';
import 'package:shartflix/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authDataSource, required this.preferences});

  final AuthRemoteDatasource authDataSource;
  final SharedPreferences preferences;

  @override
  Future<Either<AuthFailure, AuthResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = await authDataSource.login(email: email, password: password);
      debugPrint('Repository login model: ${data.toJson()}');

      if (data.token != null) {
        await preferences.setString('token', data.token!);
      }

      return Right(data);
    } on AuthFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AuthFailure(message: 'Login Error', code: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthResponseModel>> register({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final data = await authDataSource.register(
        email: email,
        name: name,
        password: password,
      );

      await preferences.setString('token', data.token!);
      return Right(data);
    } on AuthFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AuthFailure(message: 'Kayıt Başarısız', code: e.toString()));
    }
  }
}
