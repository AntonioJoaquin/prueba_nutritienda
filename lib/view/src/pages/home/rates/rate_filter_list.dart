import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/media.dart';
import '../../../common/palette.dart';
import '../../../static_data.dart';
import '../home_manager.dart';

class RateFilterList extends StatelessWidget {
  const RateFilterList(
    this._manager, {
    Key? key,
  }) : super(key: key);

  final HomeManager _manager;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: StaticData.rateItems
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () => _manager.changeRateSelection(e),
                child: ValueListenableBuilder(
                  valueListenable: e.isSelected,
                  builder: (_, bool isSelected, __) => Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: isSelected ? Palette.primaryColor : Palette.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Media.icStar),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: Text(e.value),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
