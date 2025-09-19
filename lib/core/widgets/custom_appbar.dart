import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Widget? leading;
  final double? leadingWidth;
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle,
    this.leading,
    this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.only(right: 24.w),
      titleSpacing: 24.w,
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle ?? false,
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
