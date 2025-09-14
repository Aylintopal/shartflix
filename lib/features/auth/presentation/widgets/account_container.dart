import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_paddings.dart';

class AccountContainer extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  const AccountContainer({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppPaddings.allPadding18,
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: AppColors.white5,
          border: Border.all(
            width: AppBorderStyles.borderWidth,
            color: AppBorderStyles.borderColor,
          ),
          borderRadius: AppBorderStyles.radius16,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
