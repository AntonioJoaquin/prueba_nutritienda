import 'package:injectable/injectable.dart';
import 'package:prueba_nutritienda/view/src/pages/home/sales/sale_item.dart';

import '../../../../core/src/common/custom_notifiers.dart';
import '../../../../core/src/services/navigation_service.dart';
import '../../../../di/locator.dart';
import '../../common/palette.dart';
import 'colors/color_item.dart';
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

  final colorItems = <ColorItem>[
    ColorItem(Palette.colorFilter1, 'Pink (11)'),
    ColorItem(Palette.colorFilter2, 'Blue (31)'),
    ColorItem(Palette.colorFilter3, 'Tan (60)'),
    ColorItem(Palette.colorFilter4, 'Purple (13)'),
    ColorItem(Palette.colorFilter5, 'Black (33)'),
    ColorItem(Palette.colorFilter6, 'Ivory (92)'),
    ColorItem(Palette.colorFilter7, 'Green (21)'),
    ColorItem(Palette.colorFilter8, 'Gold (19)'),
    ColorItem(Palette.colorFilter9, 'Red (19)'),
  ];

  final NavigationService _navigationService = locator<NavigationService>();

  final CustomValueNotifier<int> _totalSaleItemsSelected =
      CustomValueNotifier(0);
  CustomValueNotifier<int> get totalSaleItemsSelected =>
      _totalSaleItemsSelected;

  final CustomValueNotifier<int> _totalRateItemsSelected =
      CustomValueNotifier(0);
  CustomValueNotifier<int> get totalRateItemsSelected =>
      _totalRateItemsSelected;

  final CustomValueNotifier<int> _totalColorItemsSelected =
      CustomValueNotifier(0);
  CustomValueNotifier<int> get totalColorItemsSelected =>
      _totalColorItemsSelected;

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

  void changeColorSelection(ColorItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalColorItemsSelected.value++
        : _totalColorItemsSelected.value--;
  }

  void resetColorSelection() {
    for (ColorItem colorItem in colorItems) {
      if (colorItem.isSelected.value) {
        changeColorSelection(colorItem);
      }
    }
  }

  // navigation
  void navigateBack() => _navigationService.pop();

  void dispose() {
    _totalSaleItemsSelected.dispose();
    _totalRateItemsSelected.dispose();
    _totalColorItemsSelected.dispose();
  }
}
