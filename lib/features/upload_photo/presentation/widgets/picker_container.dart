import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class PickerContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  const PickerContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: AppBorderStyles.borderColor,
        strokeWidth: AppBorderStyles.borderWidth,
        padding: EdgeInsets.zero,
        borderPadding: EdgeInsets.zero,
        radius: Radius.circular(32.r),
        dashPattern: [4, 4],
      ),
      child: Container(
        height: height,
        width: width,
        padding: padding ?? EdgeInsets.all(72.r),
        decoration: BoxDecoration(
          color: AppColors.white5,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: child,
      ),
    );
  }
}
