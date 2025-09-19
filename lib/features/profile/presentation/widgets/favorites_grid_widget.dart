import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/custom_progress_indicator.dart';
import 'package:shartflix/features/profile/presentation/cubit/favorite_cubit.dart';
import 'package:shartflix/features/profile/presentation/cubit/favorite_state.dart';
import 'package:shartflix/features/profile/presentation/widgets/liked_card.dart';

class FavoritesGridWidget extends StatelessWidget {
  const FavoritesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return Center(child: CustomProgressIndicator());
              } else if (state is FavoriteLoaded) {
                final favorites = state.favorites;
                if (favorites != null && favorites.isNotEmpty) {
                  return GridView.builder(
                    itemCount: favorites.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.h,
                      mainAxisSpacing: 16.w,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final favorite = favorites[index];

                      return LikedMovieCard(
                        movieName: favorite.title ?? '',
                        movieDirector: favorite.director ?? '',
                        moviePoster: favorite.posterUrl ?? '',
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'Şu anda favori yok',
                      style: AppTextStyles.bodyNormalRegular,
                    ),
                  );
                }
              } else {
                return SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
