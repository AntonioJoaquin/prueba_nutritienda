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
import 'widgets/filter_option_tile.dart';

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
          _manager.totalSaleItemsSelected,
          SaleFilterList(_manager),
        ),
        FilterOption(
          'Size',
          _manager.totalSaleItemsSelected,
          const SizedBox.shrink(),
        ),
        FilterOption(
          'Brand',
          _manager.totalSaleItemsSelected,
          const SizedBox.shrink(),
        ),
        FilterOption(
          'Color',
          _manager.totalColorItemsSelected,
          const SizedBox.shrink(),
          showBottomSheetOnExpand: _showColorBottomSheet,
        ),
        FilterOption(
          'Price',
          _manager.totalSaleItemsSelected,
          const SizedBox.shrink(),
        ),
        FilterOption(
          'Rating',
          _manager.totalRateItemsSelected,
          RateFilterList(_manager),
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
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FilterOptionTile(
                      title: 'Sort by',
                      subtitle: 'Featured Items',
                    ),
                    const SizedBox(height: 28.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        'Filter by',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Palette.titleTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildFilterOptionList(),
                    const SizedBox(height: 92.0),
                  ],
                ),
              ),
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
                color: Colors.grey.withOpacity(.5),
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

  Widget _buildFilterOptionList() => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final item = _options[index];

          return ValueListenableBuilder(
            valueListenable: _options[index].amount,
            builder: (_, int amount, __) => FilterOptionTile(
              title: item.title,
              subtitle: amount > 0 ? '$amount selected' : null,
              onExpand: item.showBottomSheetOnExpand,
              expandedItem: item.child,
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(height: 1.0, thickness: 1.0),
        itemCount: _options.length,
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
        trailing: Text(
          'Reset',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Palette.primaryColor,
          ),
        ),
      );
}
