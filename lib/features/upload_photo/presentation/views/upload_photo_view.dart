import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_paddings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/routes/app_routes.dart';
import 'package:shartflix/core/widgets/custom_appbar.dart';
import 'package:shartflix/core/widgets/custom_button.dart';
import 'package:shartflix/core/widgets/gradient_widget.dart';
import 'package:shartflix/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:shartflix/features/splash/presentation/cubit/splash_state.dart';
import 'package:shartflix/features/upload_photo/presentation/cubit/upload_photo_cubit.dart';
import 'package:shartflix/features/upload_photo/presentation/cubit/upload_photo_state.dart';
import 'package:shartflix/features/upload_photo/presentation/widgets/image_picker_widget.dart';
import 'package:shartflix/gen/assets.gen.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class UploadPhotoView extends StatelessWidget {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientWidget(
      content: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: _uploadAppBar(context: context, state: state),
            body: Padding(
              padding: AppPaddings.horizontalP24,
              child: BlocBuilder<UploadPhotoCubit, UploadPhotoState>(
                builder: (context, state) {
                  final bool isPhotoUploaded = state is UploadPhotoSuccess;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 18.h,
                          horizontal: 22.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.opacityBlack,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: SvgPicture.asset(Assets.svg.vector),
                      ),
                      16.verticalSpace,
                      Text(
                        LocaleKeys.profile_page_upload_photo_txt.tr(),
                        style: AppTextStyles.heading4Bold,
                      ),
                      12.verticalSpace,
                      Text(
                        LocaleKeys.profile_page_description_txt.tr(),
                        style: AppTextStyles.bodyNormalRegular.copyWith(
                          color: AppColors.white90,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      52.verticalSpace,
                      ImagePickerWidget(),
                      132.verticalSpace,
                      CustomButton(
                        onPressed: () {
                          if (isPhotoUploaded == true) {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.navBar);
                          }
                        },
                        title: LocaleKeys.profile_page_continue_txt.tr(),
                        buttonDisabled: isPhotoUploaded,
                      ),
                      13.verticalSpace,
                      CustomButton(
                        onPressed: () => Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.navBar),

                        title: LocaleKeys.profile_page_skip_txt.tr(),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  _uploadAppBar({required BuildContext context, required state}) {
    return CustomAppbar(
      leadingWidth: 88.w,
      centerTitle: true,
      title: Text(
        LocaleKeys.profile_page_profile_detail_txt.tr(),
        style: AppTextStyles.heading5Bold,
      ),
      leading: state is SplashRegistered
          ? SizedBox.shrink()
          : IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: AppColors.white5,
                  borderRadius: AppBorderStyles.radius16,
                  border: Border.all(
                    width: AppBorderStyles.borderWidth,
                    color: AppBorderStyles.borderColor,
                  ),
                ),
                child: SvgPicture.asset(Assets.svg.arrow),
              ),
            ),
    );
  }
}
