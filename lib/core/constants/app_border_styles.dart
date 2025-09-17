import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class AppBorderStyles {
  AppBorderStyles._();

  static BorderRadius radius18 = BorderRadius.circular(18.r);
  static BorderRadius radius16 = BorderRadius.circular(16.r);
  static double borderWidth = 1;
  static Color borderColor = AppColors.white20;

  static OutlineInputBorder inputBorderStyle({Color? color}) {
    return OutlineInputBorder(
      borderRadius: radius18,
      borderSide: BorderSide(width: borderWidth, color: color ?? borderColor),
    );
  }
}
