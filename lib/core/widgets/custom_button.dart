import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/custom_progress_indicator.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool? isLoading;
  final bool? buttonDisabled;
  final Color? backgroundColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading,
    this.buttonDisabled,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: isLoading == true ? () {} : onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 32.w),
            minimumSize: Size(double.infinity, 56.h),
            backgroundColor: backgroundColor ?? AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderStyles.radius16,
            ),
          ),
          child: isLoading == true
              ? CustomProgressIndicator()
              : Text(title, style: AppTextStyles.bodyLargeSemiBold),
        ),
        if (buttonDisabled != null && buttonDisabled! == false)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: AppBorderStyles.radius16,
              ),
            ),
          ),
      ],
    );
  }
}
