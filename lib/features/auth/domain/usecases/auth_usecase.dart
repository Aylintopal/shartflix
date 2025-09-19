import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/auth/data/model/auth_response_model.dart';
import 'package:shartflix/features/auth/domain/repositories/auth_repository.dart';

@injectable
class AuthUsecase {
  final AuthRepository authRepository;
  AuthUsecase({required this.authRepository});

  Future<Either<AuthFailure, AuthResponseModel>> login({
    required String email,
    required String password,
  }) {
    return authRepository.login(email: email, password: password);
  }

  Future<Either<AuthFailure, AuthResponseModel>> register({
    required String email,
    required String name,
    required String password,
  }) {
    return authRepository.register(
      email: email,
      name: name,
      password: password,
    );
  }
}
