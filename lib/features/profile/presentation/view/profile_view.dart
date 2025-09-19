import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/constants/app_paddings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/widgets/custom_appbar.dart';
import 'package:shartflix/core/widgets/gradient_widget.dart';
import 'package:shartflix/features/profile/presentation/cubit/favorite_cubit.dart';
import 'package:shartflix/features/profile/presentation/widgets/favorites_grid_widget.dart';
import 'package:shartflix/features/profile/presentation/widgets/offer_button.dart';
import 'package:shartflix/features/profile/presentation/widgets/user_info_card.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<FavoriteCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GradientWidget(
      topGradient: false,
      content: SafeArea(
        child: Scaffold(
          appBar: _profileAppBar(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: AppPaddings.horizontalP24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                11.verticalSpace,
                UserInfoCarwidget(),
                16.verticalSpace,
                Text(
                  LocaleKeys.profile_page_favorites_txt.tr(),
                  style: AppTextStyles.bodyLargeSemiBold,
                ),
                24.verticalSpace,
                FavoritesGridWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _profileAppBar() {
    return CustomAppbar(
      centerTitle: false,
      leading: null,
      title: Text(
        LocaleKeys.home_page_profile_txt.tr(),
        style: AppTextStyles.heading5Bold,
      ),
      actions: [OfferButton()],
    );
  }
}
