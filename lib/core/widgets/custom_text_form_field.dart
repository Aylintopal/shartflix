import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/gen/assets.gen.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String label;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    required this.label,
    this.suffixIcon,
    required this.prefixIcon,
    this.isPasswordField = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  late bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(() => setState(() {}));
    _obscureText = widget.isPasswordField;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasFocus = _focusNode.hasFocus;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        focusNode: _focusNode,
        onTapOutside: (val) => FocusManager.instance.primaryFocus?.unfocus(),
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.done,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        validator: widget.validator,
        style: hasFocus
            ? AppTextStyles.bodyNormalRegular.copyWith(color: AppColors.white)
            : AppTextStyles.bodyNormalMedium.copyWith(color: AppColors.white),
        decoration: InputDecoration(
          isDense: true,
          fillColor: AppColors.white5,
          filled: true,
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  padding: EdgeInsets.only(right: 20.w),
                  icon: SvgPicture.asset(
                    _obscureText ? Assets.svg.hide : Assets.svg.see,
                    color: AppColors.white30,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 2.w),
            child: widget.prefixIcon,
          ),
          label: Text(widget.label),
          labelStyle: AppTextStyles.bodyNormalRegular.copyWith(
            color: AppColors.white50,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 20.w,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: AppBorderStyles.inputBorderStyle(),
          focusedBorder: AppBorderStyles.inputBorderStyle(
            color: AppColors.primary,
          ),
          enabledBorder: AppBorderStyles.inputBorderStyle(),
          errorBorder: AppBorderStyles.inputBorderStyle(),
          errorStyle: AppTextStyles.bodyNormalRegular.copyWith(
            color: AppColors.error,
          ),
        ),
        cursorColor: AppColors.white80,
        cursorHeight: 14.h,
      ),
    );
  }
}
