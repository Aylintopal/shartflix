import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/features/profile/presentation/widgets/bottom_sheet/offer_bottom_sheet.dart';
import 'package:shartflix/gen/assets.gen.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class OfferButton extends StatelessWidget {
  const OfferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return DraggableScrollableSheet(
              initialChildSize: 0.78,
              minChildSize: 0.78,
              maxChildSize: 0.78,
              expand: true,
              builder: (context, scrollContainer) {
                return OfferBottomSheet();
              },
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(53.r),
        ),
        backgroundBuilder: (context, states, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(53.r),
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLightDark],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: child,
          );
        },
      ),

      child: Row(
        spacing: 3.w,
        children: [
          SvgPicture.asset(Assets.svg.gem, height: 20.h, width: 20.w),
          Text(
            LocaleKeys.profile_page_limited_offer_txt.tr(),
            style: AppTextStyles.bodyNormalSemiBold,
          ),
        ],
      ),
    );
  }
}
