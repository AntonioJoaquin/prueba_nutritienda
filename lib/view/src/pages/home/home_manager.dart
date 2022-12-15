import 'package:injectable/injectable.dart';
import 'package:prueba_nutritienda/view/src/pages/home/sales/sale_item.dart';

import '../../../../core/src/common/custom_notifiers.dart';

@injectable
class HomeManager {
  final saleItems = <SaleItem>[
    SaleItem('Limited-Time Special (33)'),
    SaleItem('Clearance/closeout (113)'),
    SaleItem('Last Act (11)'),
    SaleItem('Sales & Discounts (162)'),
  ];

  final CustomValueNotifier<int> _totalSaleItemsSelected =
      CustomValueNotifier(0);
  CustomValueNotifier<int> get totalSaleItemsSelected =>
      _totalSaleItemsSelected;

  // actions
  void changeSaleSelection(SaleItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalSaleItemsSelected.value++
        : _totalSaleItemsSelected.value--;
  }

  void dispose() {
    _totalSaleItemsSelected.dispose();
  }
}
