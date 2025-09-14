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

class SplashSuccess extends SplashState {
  final bool isAuthenticated;

  SplashSuccess({required this.isAuthenticated});

  @override
  List<Object?> get props => [isAuthenticated];
}

class SplashError extends SplashState {
  final String message;

  SplashError({required this.message});

  @override
  List<Object?> get props => [message];
}
