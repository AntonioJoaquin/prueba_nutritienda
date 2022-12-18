import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/media.dart';
import '../../../common/palette.dart';
import '../colors/color_filter_list.dart';
import '../home_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(this._manager, {Key? key}) : super(key: key);

  final HomeManager _manager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 48.0, 24.0, .0),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: _manager.navigateBack,
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                ),
                Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Palette.appBarTextColor,
                  ),
                ),
                GestureDetector(
                  onTap: _manager.resetColorSelection,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28.0),
            Container(
              height: 42.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Palette.dividerColor,
              ),
              child: TextField(
                cursorColor: Palette.primaryColor,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SvgPicture.asset(Media.icSearch),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Palette.hintTextColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            ColorFilterList(_manager),
          ],
        ),
      ),
    );
  }
}
