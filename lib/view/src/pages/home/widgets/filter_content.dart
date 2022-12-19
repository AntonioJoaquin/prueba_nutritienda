import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/palette.dart';
import '../filter_option.dart';
import '../home_manager.dart';
import 'filter_option_tile.dart';

class FilterContent extends StatelessWidget {
  const FilterContent(this._manager, {required this.options, Key? key})
      : super(key: key);

  final HomeManager _manager;
  final List<FilterOption> options;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          _buildListenableFilterOptionItem(),
          const Divider(height: 1.0, thickness: 1.0),
          SwitchableFilterOption(
            title: 'In stock',
            valueListenable: _manager.inStockState,
            onChanged: (bool value) => _manager.changeInStockState(value),
          ),
          const Divider(height: 1.0, thickness: 1.0),
          SwitchableFilterOption(
            title: 'Sale',
            valueListenable: _manager.saleState,
            onChanged: (bool value) => _manager.changeSaleState(value),
          ),
          const SizedBox(height: 92.0),
        ],
      ),
    );
  }

  Widget _buildListenableFilterOptionItem() => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final item = options[index];

          return (item.amount != null)
              ? ValueListenableBuilder(
                  valueListenable: item.amount!,
                  builder: (_, int amount, __) =>
                      _buildFilterOptionItem(item, amount),
                )
              : _buildFilterOptionItem(item);
        },
        separatorBuilder: (_, __) => const Divider(height: 1.0, thickness: 1.0),
        itemCount: options.length,
      );

  Widget _buildFilterOptionItem(FilterOption item, [int amount = 0]) =>
      FilterOptionTile(
        title: item.title,
        subtitle: amount > 0 ? '$amount selected' : null,
        onExpand: item.showBottomSheetOnExpand,
        expandedItem: item.child,
      );
}

class SwitchableFilterOption extends StatelessWidget {
  const SwitchableFilterOption({
    required this.title,
    required this.valueListenable,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String title;
  final ValueListenable<bool> valueListenable;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: valueListenable,
            builder: (_, bool currentValue, __) => CupertinoSwitch(
              value: currentValue,
              activeColor: Palette.primaryColor,
              onChanged: (value) => onChanged.call(value),
            ),
          ),
        ],
      ),
    );
  }
}
