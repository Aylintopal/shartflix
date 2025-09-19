import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/upload_photo/domain/usecase/upload_photo_usecase.dart';
import 'package:shartflix/features/upload_photo/presentation/cubit/upload_photo_state.dart';

@injectable
class UploadPhotoCubit extends Cubit<UploadPhotoState> {
  UploadPhotoCubit({required this.usecase}) : super(UploadPhotoInitial());

  final ImagePicker picker = ImagePicker();
  final UploadPhotoUsecase usecase;

  Future<void> uploadPhoto() async {
    emit(UploadPhotoLoading());

    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final data = await usecase.uploadPhoto(path: File(pickedImage.path));
      data.fold(
        (failure) => emit(UploadPhotoFailure(errorMessage: failure.message)),
        (response) {
          emit(UploadPhotoSuccess(imageUrl: response));
        },
      );
    } else {
      emit(UploadPhotoInitial());
    }
  }

  void reset() {
    emit(UploadPhotoInitial());
  }
}
