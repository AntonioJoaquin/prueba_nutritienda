import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/media.dart';
import '../home_manager.dart';
import 'color_item.dart';

class ColorFilterList extends StatelessWidget {
  const ColorFilterList(this._manager, {Key? key}) : super(key: key);

  final HomeManager _manager;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _manager.colorItems.length,
      itemBuilder: (BuildContext context, int index) => _FilterColorItem(
        _manager,
        item: _manager.colorItems[index],
      ),
    );
  }
}

class _FilterColorItem extends StatelessWidget {
  const _FilterColorItem(
    this._manager, {
    required this.item,
    Key? key,
  }) : super(key: key);

  final HomeManager _manager;
  final ColorItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 32.0,
                width: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.color,
                ),
              ),
              const SizedBox(width: 12.0),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 16.0.sp,
                ),
              ),
            ],
          ),
          _buildSaleCheckbox(),
        ],
      ),
    );
  }

  Widget _buildSaleCheckbox() => GestureDetector(
        onTap: () => _manager.changeColorSelection(item),
        child: ValueListenableBuilder(
          valueListenable: item.isSelected,
          builder: (_, bool isSelected, __) => Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: isSelected ? null : Border.all(color: Colors.grey),
              color: isSelected ? Colors.pink : null,
            ),
            child: Visibility(
              visible: isSelected,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 7.0,
                ),
                child: SvgPicture.asset(Media.icCheck),
              ),
            ),
          ),
        ),
      );
}
