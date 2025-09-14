import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/gen/assets.gen.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.svg.logo);
  }
}
