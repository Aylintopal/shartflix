import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/custom_button.dart';
import 'package:shartflix/core/widgets/custom_close_button.dart';
import 'package:shartflix/features/profile/presentation/widgets/bottom_sheet/obs_bonus_card.dart';
import 'package:shartflix/features/profile/presentation/widgets/bottom_sheet/obs_background.dart';
import 'package:shartflix/features/profile/presentation/widgets/bottom_sheet/obs_token_package_card.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class OfferBottomSheet extends StatelessWidget {
  const OfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tokenCardList = [
      Flexible(
        child: TokenPackageCard(
          bonus: '10',
          oldAmount: '200',
          newAmount: '300',
          price: '99,99',
        ),
      ),
      Flexible(
        child: TokenPackageCard(
          bonus: '70',
          oldAmount: '2.000',
          newAmount: '3.375',
          price: '799,99',
          gradientColor: AppColors.secondary,
          bonusBgColor: AppColors.secondary,
        ),
      ),
      Flexible(
        child: TokenPackageCard(
          bonus: '35',
          oldAmount: '1.000',
          newAmount: '1.350',
          price: '399,99',
        ),
      ),
    ];

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(34.r)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          OfferBottomSheetBackground(),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, top: 6.w),
              child: CustomCloseButton(
                height: 36.h,
                width: 36.w,
                margin: EdgeInsets.all(16.r),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.profile_page_limited_offer_txt.tr(),
                  style: AppTextStyles.heading4Bold,
                ),
                6.verticalSpace,
                Text(
                  LocaleKeys.profile_page_offer_desc_txt.tr(),
                  style: AppTextStyles.bodyNormalRegular,
                  textAlign: TextAlign.center,
                ),
                24.verticalSpace,
                OfferBottomSheetBonusCard(),
                24.verticalSpace,
                Text(
                  LocaleKeys.profile_page_select_token_package_txt.tr(),
                  style: AppTextStyles.bodyLargeMedium,
                ),
                22.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12.w,
                  children: tokenCardList,
                ),
                24.verticalSpace,
                CustomButton(
                  onPressed: () {},
                  title: LocaleKeys.profile_page_show_all_token_txt.tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
