import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStatePropertyAll(Size.zero),
        ),
        child: Text(
          LocaleKeys.auth_page_forgot_password_txt.tr(),
          style: AppTextStyles.bodyNormalSemiBold,
        ),
      ),
    );
  }
}
