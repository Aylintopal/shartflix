import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_paddings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/features/home/data/models/movie_model.dart';
import 'package:shartflix/features/home/presentation/widgets/expandable_text.dart';
import 'package:shartflix/features/home/presentation/widgets/favorite_button.dart';
import 'package:shartflix/gen/assets.gen.dart';

class MoviePageView extends StatelessWidget {
  const MoviePageView({
    super.key,
    required PageController pageController,
    required this.movies,
    required this.onChanged,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<MovieModel> movies;
  final Function(int)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: movies.length,
      onPageChanged: onChanged,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie.posterUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTree) =>
                  Center(child: SvgPicture.asset(Assets.svg.x)),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.dark, AppColors.shadowBlack],
                  stops: [0.55, 1],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Container(height: 10, color: Colors.black),
            ),
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: AppPaddings.horizontalP24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FavoriteButton(),
                    20.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(Assets.svg.whiteLogo),
                        ),
                        16.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title!,
                                style: AppTextStyles.bodyXLargeBold,
                              ),
                              ExpandableText(text: movie.description!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
