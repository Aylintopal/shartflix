import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/features/home/presentation/views/home_view.dart';
import 'package:shartflix/features/home/presentation/widgets/custom_navbar_button.dart';
import 'package:shartflix/features/profile/presentation/view/profile_view.dart';
import 'package:shartflix/gen/assets.gen.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomeView(), ProfileView()];

  void _onTabTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        height: 100.h,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        decoration: BoxDecoration(border: Border.all(width: 0)),
        child: Row(
          spacing: 16.w,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNavBarButton(
              title: LocaleKeys.home_page_home_page_txt.tr(),
              defaultIcon: Assets.svg.home,
              selectedIcon: Assets.svg.homeFill,
              isSelected: _currentIndex == 0,
              onPressed: () => _onTabTapped(0),
            ),
            CustomNavBarButton(
              title: LocaleKeys.home_page_profile_txt.tr(),
              defaultIcon: Assets.svg.profile,
              selectedIcon: Assets.svg.profileFill,
              isSelected: _currentIndex == 1,
              onPressed: () => _onTabTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}
