import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/upload_photo/data/datasource/upload_photo_remotedatasource.dart';

@LazySingleton(as: UploadPhotoRemotedatasource)
class UploadPhotoRemotedatasourceImpl implements UploadPhotoRemotedatasource {
  final Dio dio;
  UploadPhotoRemotedatasourceImpl({required this.dio});

  @override
  Future<String> uploadPhoto({required File path}) async {
    try {
      final fileName = path.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(path.path, filename: fileName),
      });

      final response = await dio.post('user/upload_photo', data: formData);

      return response.data['data']['photoUrl'] as String;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
