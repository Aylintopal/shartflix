import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class GradientWidget extends StatelessWidget {
  final Widget content;
  final bool? topGradient;
  const GradientWidget({super.key, required this.content, this.topGradient});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                topGradient == false ? AppColors.maroon : AppColors.maroon,
                AppColors.dark,
              ],
              stops:  [0.3,   0.6],
            ),
          ),
        ),
        topGradient == false
            ? SizedBox.shrink()
            : Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 0.4,
                    colors: [AppColors.primary, AppColors.opacityBlack],
                    stops: [0, 1],
                  ),
                ),
              ),
        content,
      ],
    );
  }
}
