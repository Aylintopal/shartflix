import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/gen/assets.gen.dart';

class LikedMovieCard extends StatelessWidget {
  final String movieName;
  final String movieDirector;
  final String moviePoster;
  const LikedMovieCard({
    super.key,
    required this.movieName,
    required this.movieDirector,
    required this.moviePoster,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 196.h,
          width: 169.w,
          decoration: BoxDecoration(
            color: AppColors.white5,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              fit: BoxFit.cover,
              moviePoster,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(Assets.svg.x, fit: BoxFit.none);
              },
            ),
          ),
        ),
        16.verticalSpace,
        Text(
          movieName,
          style: AppTextStyles.bodyNormalSemiBold,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          movieDirector,
          style: AppTextStyles.bodyNormalRegular.copyWith(
            color: AppColors.white50,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
