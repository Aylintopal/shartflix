import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/gradient_widget.dart';
import 'package:shartflix/gen/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWidget(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.svg.logo, height: 78.h, width: 78.w),
            Text(AppStrings.appNameTxt, style: AppTextStyles.heading3Bold),
          ],
        ),
      ),
    );
  }
}
