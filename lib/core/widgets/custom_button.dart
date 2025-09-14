import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_paddings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
        padding: AppPaddings.buttonPadding,
        minimumSize: Size(double.infinity, 56.h),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: AppBorderStyles.radius16),
      ),
      child: isLoading
          ? CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.white,
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              padding: EdgeInsets.zero,
            )
          : Text(title, style: AppTextStyles.bodyLargeSemiBold),
    );
  }
}
