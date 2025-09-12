import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:shartflix/core/enums/locales_enum.dart';

@immutable
final class LocalizationManager extends EasyLocalization {
  LocalizationManager({super.key, required super.child})
    : super(
        supportedLocales: _supportedLocalesList,
        path: _translationPath,
        fallbackLocale: Locales.en.locale,
        useOnlyLangCode: true,
      );

  static const String _translationPath = 'assets/translations';
  static final List<Locale> _supportedLocalesList = [
    Locales.en.locale,
    Locales.tr.locale,
  ];
}
