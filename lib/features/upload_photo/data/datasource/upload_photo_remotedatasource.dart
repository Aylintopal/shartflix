import 'dart:io';

abstract class UploadPhotoRemotedatasource {
  Future<String> uploadPhoto({required File path});
}
