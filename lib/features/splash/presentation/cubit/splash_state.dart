import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoggedIn extends SplashState {
  final bool isAuthenticated;

  SplashLoggedIn({required this.isAuthenticated});

  @override
  List<Object?> get props => [isAuthenticated];
}

class SplashRegistered extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashError extends SplashState {
  final String message;

  SplashError({required this.message});

  @override
  List<Object?> get props => [message];
}
