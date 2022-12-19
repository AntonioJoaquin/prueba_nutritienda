import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/media.dart';
import '../../../common/palette.dart';
import '../home_manager.dart';
import 'sale_item.dart';

class SaleFilterList extends StatelessWidget {
  const SaleFilterList(
    this._manager, {
    Key? key,
  }) : super(key: key);

  final HomeManager _manager;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _manager.saleItems.length,
      itemBuilder: (_, index) => _FilterSaleItem(
        _manager,
        item: _manager.saleItems[index],
      ),
    );
  }
}

class _FilterSaleItem extends StatelessWidget {
  const _FilterSaleItem(
    this._manager, {
    required this.item,
    Key? key,
  }) : super(key: key);

  final HomeManager _manager;
  final SaleItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.title),
          _buildSaleCheckbox(),
        ],
      ),
    );
  }

  Widget _buildSaleCheckbox() => GestureDetector(
        onTap: () => _manager.changeSaleSelection(item),
        child: ValueListenableBuilder(
          valueListenable: item.isSelected,
          builder: (_, bool isSelected, __) => Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: isSelected ? null : Border.all(color: Palette.grey),
              color: isSelected ? Palette.primaryColor : null,
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
