import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class OfferBottomSheetBackground extends StatelessWidget {
  const OfferBottomSheetBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [AppColors.primary, AppColors.dark],
              stops: const [0.3, 0.6],
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              radius: 0.7,
              colors: [AppColors.primary, AppColors.opacityBlack],
              stops: [0, 1],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.9),
              colors: [AppColors.primary, AppColors.opacityBlack],
              stops: [0, 1],
            ),
          ),
        ),
      ],
    );
  }
}
