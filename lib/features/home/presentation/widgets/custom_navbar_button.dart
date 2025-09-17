import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class CustomNavBarButton extends StatelessWidget {
  final String title;
  final String selectedIcon;
  final String defaultIcon;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomNavBarButton({
    super.key,
    required this.title,
    required this.selectedIcon,
    required this.defaultIcon,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          side: BorderSide(
            width: AppBorderStyles.borderWidth,
            color: AppBorderStyles.borderColor,
          ),
          backgroundBuilder: (context, states, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(42.r),
                gradient: isSelected
                    ? RadialGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        radius: 2,
                      )
                    : null,
                border: Border.all(
                  width: AppBorderStyles.borderWidth,
                  color: AppBorderStyles.borderColor,
                ),
              ),
              child: child,
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 6.w,
          children: [
            SvgPicture.asset(
              isSelected ? selectedIcon : defaultIcon,
              height: 22.h,
              width: 22.w,
            ),
            Text(title, style: AppTextStyles.bodyNormalMedium),
          ],
        ),
      ),
    );
  }
}
