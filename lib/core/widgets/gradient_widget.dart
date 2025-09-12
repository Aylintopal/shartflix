import 'package:flutter/cupertino.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class GradientWidget extends StatelessWidget {
  final Widget content;
  const GradientWidget({super.key, required this.content});

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
              colors: [AppColors.maroon, AppColors.dark],
              stops: const [0.3, 0.5],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 0.4,
              colors: [AppColors.primary, AppColors.myColor],
              stops: [0.0, 1],
            ),
          ),
        ),
        content,
      ],
    );
  }
}