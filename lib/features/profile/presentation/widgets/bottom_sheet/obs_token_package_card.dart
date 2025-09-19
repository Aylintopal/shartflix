import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class TokenPackageCard extends StatelessWidget {
  final String bonus;
  final String oldAmount;
  final String newAmount;
  final String price;
  final Color? gradientColor;
  final Color? bonusBgColor;
  const TokenPackageCard({
    super.key,
    required this.bonus,
    required this.oldAmount,
    required this.newAmount,
    required this.price,
    this.gradientColor,
    this.bonusBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.maroon,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.white40,
              width: AppBorderStyles.borderWidth,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                gradientColor ?? AppColors.primaryDark,
                AppColors.primary,
              ],
              stops: [0.15, 0.8],
            ),
          ),
          child: _buildMainContainer(),
        ),
        _buildBonusContainer(backgroundColor: bonusBgColor),
      ],
    );
  }

  Column _buildMainContainer() {
    return Column(
      children: [
        19.verticalSpace,
        Text(
          oldAmount,
          style: AppTextStyles.bodyNormalMedium.copyWith(
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.white,
            fontSize: 15.sp,
          ),
        ),
        FittedBox(child: Text(newAmount, style: AppTextStyles.heading3Bold)),
        Text(
          LocaleKeys.profile_page_token_txt.tr(),
          style: AppTextStyles.bodyNormalMedium,
        ),
        4.verticalSpace,
        Divider(color: AppColors.white10),
        4.verticalSpace,
        FittedBox(child: Text("₺$price", style: AppTextStyles.bodyLargeBold)),
        FittedBox(
          child: Text(
            LocaleKeys.profile_page_weekly_txt.tr(),
            style: AppTextStyles.bodySmallMedium,
          ),
        ),
      ],
    );
  }

  Positioned _buildBonusContainer({Color? backgroundColor}) {
    return Positioned(
      top: -10.h,
      left: 0,
      right: 0,
      child: Center(
        child: InnerShadow(
          shadows: [
            Shadow(color: AppColors.white, blurRadius: 8, offset: Offset(0, 0)),
          ],
          child: Container(
            height: 23.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: backgroundColor ?? AppColors.primaryDark,
            ),
            child: Center(
              widthFactor: 1,
              child: Text("+$bonus%", style: AppTextStyles.bodySmallRegular),
            ),
          ),
        ),
      ),
    );
  }
}
