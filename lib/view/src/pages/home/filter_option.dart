import 'package:flutter/widgets.dart';

import '../../../../core/src/common/custom_notifiers.dart';

class FilterOption {
  final String title;
  final CustomValueNotifier<int>? amount;
  final Widget child;
  final Function? showBottomSheetOnExpand;

  FilterOption(
    this.title,
    this.child, {
    this.amount,
    this.showBottomSheetOnExpand,
  });
}
