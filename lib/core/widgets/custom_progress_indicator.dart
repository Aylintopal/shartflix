import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: AppColors.white,
      strokeWidth: 1.5,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      padding: EdgeInsets.zero,
    );
  }
}
