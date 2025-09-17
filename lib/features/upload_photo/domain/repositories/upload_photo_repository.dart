import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:shartflix/core/failure/auth_failure.dart';

abstract class UploadPhotoRepository {
  Future<Either<AppFailure, String>> uploadPhoto({required File path});
}
