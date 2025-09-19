import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_assets.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class OfferBottomSheetBonusCard extends StatelessWidget {
  const OfferBottomSheetBonusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bonussesCardList = [
      buildBonusItemsCard(
        icon: AppAssets.diamondPng,
        title: LocaleKeys.profile_page_premium_account_txt.tr(),
      ),
      buildBonusItemsCard(
        icon: AppAssets.heart2Png,
        title: LocaleKeys.profile_page_matches_txt.tr(),
      ),
      buildBonusItemsCard(
        icon: AppAssets.topArrowPng,
        title: LocaleKeys.profile_page_highlight_txt.tr(),
      ),
      buildBonusItemsCard(
        icon: AppAssets.heartPng,
        title: LocaleKeys.profile_page_more_likes_txt.tr(),
      ),
    ];

    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.opacityBlack,
        gradient: RadialGradient(
          colors: [AppColors.white30, AppColors.white10],
          radius: 1,
        ),
        border: Border.all(
          width: AppBorderStyles.borderWidth,
          color: AppBorderStyles.borderColor,
        ),
      ),
      child: Column(
        children: [
          Text(
            LocaleKeys.profile_page_bonuses_txt.tr(),
            style: AppTextStyles.bodyLargeMedium,
          ),
          14.verticalSpace,
          Row(spacing: 12.w, children: bonussesCardList),
        ],
      ),
    );
  }
}

Flexible buildBonusItemsCard({required String icon, required String title}) {
  return Flexible(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12.h,
      children: [
        InnerShadow(
          shadows: [
            Shadow(color: AppColors.white, blurRadius: 8, offset: Offset(0, 0)),
          ],
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryDark,
            ),
            child: Image.asset(icon, height: 56.h, width: 56.w),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.bodySmallRegular,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    ),
  );
}
