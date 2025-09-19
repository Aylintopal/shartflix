import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/models/user_model.dart';
import 'package:shartflix/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:shartflix/features/profile/presentation/cubit/profile_state.dart';
import 'package:shartflix/features/upload_photo/presentation/views/upload_photo_view.dart';
import 'package:shartflix/gen/assets.gen.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class UserInfoCarwidget extends StatefulWidget {
  const UserInfoCarwidget({super.key});

  @override
  State<UserInfoCarwidget> createState() => _UserInfoCarwidgetState();
}

class _UserInfoCarwidgetState extends State<UserInfoCarwidget> {
  @override
  void initState() {
    context.read<ProfileCubit>().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        String userName = '';
        String userId = '';
        String? userPhoto;
        if (state is ProfileError) {
          return SizedBox.shrink();
        } else if (state is ProfileLoaded) {
          final UserModel user = state.user;
          userName = user.name;
          userId = user.id;
          userPhoto = user.photoUrl;
        }
        return Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: (userPhoto != null && userPhoto.isNotEmpty)
                  ? NetworkImage(userPhoto)
                  : null,
              backgroundColor: userPhoto == null || userPhoto.isEmpty
                  ? AppColors.white20
                  : null,
              child: userPhoto == null || userPhoto.isEmpty
                  ? SvgPicture.asset(
                      Assets.svg.profileFill,
                      color: AppColors.white50,
                    )
                  : null,
            ),
            8.horizontalSpace,
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 8.h,
                children: [
                  Text(
                    userName,
                    style: AppTextStyles.bodyLargeSemiBold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    "ID: $userId",
                    style: AppTextStyles.bodyNormalMedium.copyWith(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadPhotoView()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 19.w),
                backgroundColor: AppColors.white5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                LocaleKeys.profile_page_add_photo_txt.tr(),
                style: AppTextStyles.bodyNormalSemiBold,
              ),
            ),
          ],
        );
      },
    );
  }
}
