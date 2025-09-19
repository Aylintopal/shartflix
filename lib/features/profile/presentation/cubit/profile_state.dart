import 'package:equatable/equatable.dart';
import 'package:shartflix/core/models/user_model.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoaded extends ProfileState {
  final UserModel user;

  ProfileLoaded({required this.user});
  @override
  List<Object?> get props => [user];
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
