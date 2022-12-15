import 'package:injectable/injectable.dart';
import 'package:prueba_nutritienda/view/src/pages/home/sales/sale_item.dart';

import '../../../../core/src/common/custom_notifiers.dart';
import 'rates/rate_item.dart';

@injectable
class HomeManager {
  final saleItems = <SaleItem>[
    SaleItem('Limited-Time Special (33)'),
    SaleItem('Clearance/closeout (113)'),
    SaleItem('Last Act (11)'),
    SaleItem('Sales & Discounts (162)'),
  ];

  final rateItems = <RateItem>[
    RateItem('1'),
    RateItem('2'),
    RateItem('3'),
    RateItem('4'),
    RateItem('5'),
  ];

  final CustomValueNotifier<int> _totalSaleItemsSelected =
      CustomValueNotifier(0);
  CustomValueNotifier<int> get totalSaleItemsSelected =>
      _totalSaleItemsSelected;

  final CustomValueNotifier<int> _totalRateItemsSelected =
      CustomValueNotifier(0);
  CustomValueNotifier<int> get totalRateItemsSelected =>
      _totalRateItemsSelected;

  // actions
  void changeSaleSelection(SaleItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalSaleItemsSelected.value++
        : _totalSaleItemsSelected.value--;
  }

  void changeRateSelection(RateItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalRateItemsSelected.value++
        : _totalRateItemsSelected.value--;
  }

  void dispose() {
    _totalSaleItemsSelected.dispose();
    _totalRateItemsSelected.dispose();
  }
}
