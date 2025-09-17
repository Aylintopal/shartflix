import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.text,
          style: AppTextStyles.bodyNormalRegular,
          maxLines: _isExpanded ? null : 2,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        if (widget.text.length > 50)
          InkWell(
            onTap: () {
              setState(() => _isExpanded = !_isExpanded);
            },
            child: Text(
              _isExpanded
                  ? LocaleKeys.home_page_hide_txt.tr()
                  : LocaleKeys.home_page_read_more_txt.tr(),
              style: AppTextStyles.bodyNormalSemiBold,
            ),
          ),
      ],
    );
  }
}
