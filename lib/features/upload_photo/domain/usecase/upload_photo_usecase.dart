import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/auth_failure.dart';
import 'package:shartflix/features/upload_photo/domain/repositories/upload_photo_repository.dart';

@injectable
class UploadPhotoUsecase {
  final UploadPhotoRepository repository;

  UploadPhotoUsecase({required this.repository});

  Future<Either<AppFailure, String>> uploadPhoto({
    required File path,
  }) => repository.uploadPhoto(path: path);
}
