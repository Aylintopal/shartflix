import 'package:equatable/equatable.dart';

sealed class UploadPhotoState extends Equatable {
  const UploadPhotoState();
}

final class UploadPhotoInitial extends UploadPhotoState {
  @override
  List<Object?> get props => [];
}

final class UploadPhotoLoading extends UploadPhotoState {
  @override
  List<Object?> get props => [];
}

final class UploadPhotoSuccess extends UploadPhotoState {
  final String imageUrl;

  const UploadPhotoSuccess({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

final class UploadPhotoFailure extends UploadPhotoState {
  final String errorMessage;

  const UploadPhotoFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
