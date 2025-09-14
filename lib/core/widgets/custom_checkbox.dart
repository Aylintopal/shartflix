import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_border_styles.dart';
import 'package:shartflix/core/constants/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final ValueNotifier<bool> isSelected;
  final Widget title;

  const CustomCheckBox({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSelected,
      builder: (context, value, child) {
        return CheckboxListTile(
          value: value,
          title: title,
          onChanged: (val) {
            isSelected.value = !value;
          },
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          contentPadding: EdgeInsets.zero,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          side: BorderSide(
            color: AppBorderStyles.borderColor,
            width: AppBorderStyles.borderWidth,
          ),
          checkColor: Colors.white,
          fillColor: WidgetStatePropertyAll(
            value ? AppColors.primary : AppColors.white5,
          ),
        );
      },
    );
  }
}
