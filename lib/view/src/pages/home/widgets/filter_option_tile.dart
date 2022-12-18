import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/palette.dart';

class FilterOptionTile extends StatelessWidget {
  const FilterOptionTile({
    required this.title,
    this.subtitle,
    this.expandedItem,
    this.onExpand,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Widget? expandedItem;
  final Function? onExpand;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: Palette.titleTextColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: Palette.subTitleTextColor,
              ),
            )
          : null,
      onExpansionChanged: (_) => onExpand?.call(),
      children: expandedItem != null ? [expandedItem!] : [],
    );
  }
}
