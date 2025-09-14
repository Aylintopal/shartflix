import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

SnackBar customSnackbar({required String title}) {
  return SnackBar(
    content: Text(
      textAlign: TextAlign.center,
      title,
      style: AppTextStyles.bodyNormalMedium,
    ),
    backgroundColor: AppColors.maroon,
  );
}
