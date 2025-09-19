import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/gen/assets.gen.dart';

class FavoriteButton extends StatefulWidget {
  final bool isLiked;
  final VoidCallback? onTap;

  const FavoriteButton({super.key, required this.isLiked, this.onTap});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool liked;

  @override
  void initState() {
    super.initState();
    liked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => liked = !liked);
        widget.onTap?.call();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: 72.h,
            width: 52.w,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              border: Border.all(
                width: AppBorderStyles.borderWidth,
                color: AppColors.white60,
              ),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: SvgPicture.asset(
              liked ? Assets.svg.heartFill : Assets.svg.heart,
              color: liked ? AppColors.primary : null,
            ),
          ),
        ),
      ),
    );
  }
}
