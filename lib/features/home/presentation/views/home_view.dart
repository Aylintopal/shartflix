import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/custom_progress_indicator.dart';
import 'package:shartflix/core/widgets/gradient_widget.dart';
import 'package:shartflix/features/home/presentation/cubit/movie_cubit.dart';
import 'package:shartflix/features/home/presentation/cubit/movie_state.dart';
import 'package:shartflix/features/home/presentation/widgets/movie_page_view.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    context.read<MovieCubit>().getMovieList(page: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWidget(
        content: SafeArea(
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(child: CustomProgressIndicator());
              } else if (state is MovieLoaded) {
                final movies = state.movieList.movies;
                final currentPage = state.movieList.currentPage;
                final totalPages = state.movieList.totalPages;
                if (movies.isEmpty) {
                  return Center(
                    child: Text(
                      LocaleKeys.error_texts_no_movies_found.tr(),
                      style: AppTextStyles.bodyNormalRegular.copyWith(
                        color: AppColors.white20,
                      ),
                    ),
                  );
                }
                return MoviePageView(
                  pageController: _pageController,
                  movies: movies,
                  onChanged: (page) {
                    if (page == movies.length - 1 && currentPage < totalPages) {
                      setState(() => _currentPage++);
                      context.read<MovieCubit>().getMovieList(
                        page: _currentPage,
                      );
                    }
                  },
                );
              } else if (state is MovieError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
