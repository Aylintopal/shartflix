import 'package:shartflix/core/models/user_model.dart';

class AuthResponseModel {
  final String? token;
  final UserModel? user;

  const AuthResponseModel({this.token, this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'] as String?,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {'token': token, 'user': user?.toJson()};
}
