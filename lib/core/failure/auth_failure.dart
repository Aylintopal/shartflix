import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

abstract class AppFailure extends Equatable {
  final String message;
  final String code;
  const AppFailure({required this.message, required this.code});

  @override
  List<Object?> get props => [message, code];
}

class AuthFailure extends AppFailure {
  const AuthFailure({required super.message, required super.code});

  String handleException(code) {
    switch (code) {
      case 'USER_EXISTS':
        return LocaleKeys.error_texts_invalid_credential_txt.tr();
      case 'INVALID_CREDENTIALS':
        return LocaleKeys.error_texts_invalid_credential_txt.tr();
      default:
        return LocaleKeys.error_texts_register_default_error_txt.tr();
    }
  }
}
class PhotoUploadFailure extends AppFailure {
  const PhotoUploadFailure({required super.message, required super.code});
}
