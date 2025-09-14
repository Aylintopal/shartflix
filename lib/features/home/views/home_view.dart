import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('home', style: AppTextStyles.heading1Bold.copyWith(color: Colors.black))),
    );
  }
}
