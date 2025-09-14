import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/custom_checkbox.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class AgreementWidget extends StatelessWidget {
  const AgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> check = ValueNotifier(false);
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomCheckBox(
        isSelected: check,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.auth_page_agreement_prefix_txt.tr(),
                style: AppTextStyles.bodySmallRegular.copyWith(
                  color: AppColors.white60,
                ),
              ),
              TextSpan(
                text: LocaleKeys.auth_page_agrement_accept_txt.tr(),
                style: AppTextStyles.bodySmallSemiBold.copyWith(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                text: LocaleKeys.auth_page_agreement_suffix_txt.tr(),
                style: AppTextStyles.bodySmallRegular.copyWith(
                  color: AppColors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
