import 'package:dartz/dartz.dart';
import 'package:shartflix/core/failure/auth_failure.dart';
import 'package:shartflix/features/auth/data/model/auth_response_model.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, AuthResponseModel>> login({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, AuthResponseModel>> register({
    required String email,
    required String name,
    required String password,
  });
}
