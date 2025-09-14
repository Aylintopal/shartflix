import 'package:equatable/equatable.dart';
import 'package:shartflix/features/auth/data/model/auth_response_model.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final AuthResponseModel user;
  AuthSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}

