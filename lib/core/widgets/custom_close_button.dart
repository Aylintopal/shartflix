import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class CustomCloseButton extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final VoidCallback onPressed;
  const CustomCloseButton({
    super.key,
    this.height,
    this.width,
    this.margin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CloseButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: height != null && width != null
            ? WidgetStatePropertyAll(Size(width!, height!))
            : null,
        padding: WidgetStatePropertyAll(EdgeInsets.all(6.r)),
        iconColor: WidgetStatePropertyAll(AppColors.white),
        side: WidgetStatePropertyAll(
          BorderSide(
            width: AppBorderStyles.borderWidth,
            color: AppColors.white50,
          ),
        ),
      ),
    );
  }
}
