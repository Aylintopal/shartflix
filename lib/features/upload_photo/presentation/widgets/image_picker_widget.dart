import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/widgets/custom_progress_indicator.dart';
import 'package:shartflix/features/upload_photo/presentation/cubit/upload_photo_cubit.dart';
import 'package:shartflix/features/upload_photo/presentation/cubit/upload_photo_state.dart';
import 'package:shartflix/features/upload_photo/presentation/widgets/picker_container.dart';
import 'package:shartflix/gen/assets.gen.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadPhotoCubit, UploadPhotoState>(
      builder: (context, state) {
        if (state is UploadPhotoLoading) {
          return PickerContainer(child: CustomProgressIndicator());
        } else if (state is UploadPhotoFailure) {
          return Text(state.errorMessage);
        } else if (state is UploadPhotoSuccess) {
          return successWidget(state, context);
        }
        return GestureDetector(
          onTap: () {
            context.read<UploadPhotoCubit>().uploadPhoto();
          },
          child: PickerContainer(child: SvgPicture.asset(Assets.svg.plus)),
        );
      },
    );
  }

  Column successWidget(UploadPhotoSuccess state, BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        PickerContainer(
          height: 176.h,
          width: 176.w,
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: Image.network(state.imageUrl, fit: BoxFit.cover),
          ),
        ),
        InkWell(
          onTap: () {
            context.read<UploadPhotoCubit>().reset();
          },
          child: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                width: AppBorderStyles.borderWidth,
                color: AppColors.white50,
              ),
            ),
            child: SvgPicture.asset(Assets.svg.x),
          ),
        ),
      ],
    );
  }
}
