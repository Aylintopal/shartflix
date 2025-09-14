import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class AuthTitlesWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthTitlesWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.heading4Bold,
        ),
        Text(
          subtitle,
          style: AppTextStyles.bodyNormalRegular,
        ),
      ],
    );
  }
}
