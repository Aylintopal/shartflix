import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class AuthFooter extends StatelessWidget {
  final String title;
  final String subtitle;
  final String routeName;
  const AuthFooter({
    super.key,
    required this.title,
    required this.subtitle,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: title, style: AppTextStyles.bodyNormalRegular),
          TextSpan(
            text: subtitle,
            style: AppTextStyles.bodyNormalSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(context, routeName),
          ),
        ],
      ),
    );
  }
}
