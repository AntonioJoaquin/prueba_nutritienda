import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di/locator.dart';
import '../../common/palette.dart';
import 'filter_option.dart';
import 'home_manager.dart';
import 'rates/rate_filter_list.dart';
import 'sales/sale_filter_list.dart';
import 'widgets/custom_bottom_sheet.dart';
import 'widgets/filter_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeManager _manager = locator<HomeManager>();

  final _options = <FilterOption>[];

  @override
  void initState() {
    _initFilterOptions();

    super.initState();
  }

  void _initFilterOptions() => _options.addAll([
        FilterOption(
          'Sales & Offers',
          SaleFilterList(_manager),
          amount: _manager.totalSaleItemsSelected,
        ),
        FilterOption(
          'Size',
          const SizedBox.shrink(),
        ),
        FilterOption(
          'Brand',
          const SizedBox.shrink(),
          showBottomSheetOnExpand: () {},
        ),
        FilterOption(
          'Color',
          const SizedBox.shrink(),
          amount: _manager.totalColorItemsSelected,
          showBottomSheetOnExpand: _showColorBottomSheet,
        ),
        FilterOption(
          'Price',
          const SizedBox.shrink(),
          showBottomSheetOnExpand: () {},
        ),
        FilterOption(
          'Rating',
          RateFilterList(_manager),
          amount: _manager.totalRateItemsSelected,
        ),
      ]);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _buildNavigationBar(),
      child: SafeArea(
        child: Material(
          color: Palette.white,
          child: Stack(
            children: [
              FilterContent(_manager, options: _options),
              _buildShowButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShowButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 24.0,
          ),
          decoration: BoxDecoration(
            color: Palette.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 3.0,
                blurRadius: 1.0,
                color: Palette.shadowColor,
              )
            ],
          ),
          child: CupertinoButton(
            color: Palette.primaryColor,
            onPressed: () {},
            child: Text(
              'Show (32 results)',
              style: TextStyle(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );

  CupertinoNavigationBar _buildNavigationBar() => CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.0,
          color: Palette.iconColor,
        ),
        middle: Text(
          'Sort & Filter',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Palette.appBarTextColor,
          ),
        ),
        trailing: GestureDetector(
          onTap: _manager.resetAll,
          child: Text(
            'Reset',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Palette.primaryColor,
            ),
          ),
        ),
      );

  // Functions
  void _showColorBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (_) => CustomBottomSheet(_manager),
    );
  }
}
