import 'package:shartflix/features/auth/data/model/auth_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> register({
    required String email,
    required String name,
    required String password,
  });
}
