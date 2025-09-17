import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/auth_failure.dart';
import 'package:shartflix/features/upload_photo/data/datasource/upload_photo_remotedatasource.dart';
import 'package:shartflix/features/upload_photo/domain/repositories/upload_photo_repository.dart';

@LazySingleton(as: UploadPhotoRepository)
class UploadPhotoRepositoryImpl implements UploadPhotoRepository {
  final UploadPhotoRemotedatasource dataSource;
  const UploadPhotoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppFailure, String>> uploadPhoto({required File path}) async {
    try {
      final response = await dataSource.uploadPhoto(path: path);
      return Right(response);
    } on PhotoUploadFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        MovieFailure(message: 'Upload Photo Error', code: e.toString()),
      );
    }
  }
}
