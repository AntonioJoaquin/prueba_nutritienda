import 'package:injectable/injectable.dart';
import 'package:prueba_nutritienda/view/src/pages/home/sales/sale_item.dart';

import '../../../../core/src/common/custom_notifiers.dart';
import '../../../../core/src/services/navigation_service.dart';
import '../../../../di/locator.dart';
import '../../static_data.dart';
import 'colors/color_item.dart';
import 'rates/rate_item.dart';

@injectable
class HomeManager {
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

  final CustomValueNotifier<bool> _inStockState = CustomValueNotifier(false);
  CustomValueNotifier<bool> get inStockState => _inStockState;

  final CustomValueNotifier<bool> _saleState = CustomValueNotifier(false);
  CustomValueNotifier<bool> get saleState => _saleState;

  // actions
  void changeSaleSelection(SaleItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalSaleItemsSelected.value++
        : _totalSaleItemsSelected.value--;
  }

  void _resetSaleSelection() {
    for (SaleItem saleItem in StaticData.saleItems) {
      if (saleItem.isSelected.value) {
        changeSaleSelection(saleItem);
      }
    }
  }

  void changeRateSelection(RateItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalRateItemsSelected.value++
        : _totalRateItemsSelected.value--;
  }

  void _resetRateSelection() {
    for (RateItem rateItem in StaticData.rateItems) {
      if (rateItem.isSelected.value) {
        changeRateSelection(rateItem);
      }
    }
  }

  void changeColorSelection(ColorItem item) {
    item.changeSelection();

    item.isSelected.value
        ? _totalColorItemsSelected.value++
        : _totalColorItemsSelected.value--;
  }

  void resetColorSelection() {
    for (ColorItem colorItem in StaticData.colorItems) {
      if (colorItem.isSelected.value) {
        changeColorSelection(colorItem);
      }
    }
  }

  void changeInStockState(bool value) => _inStockState.value = value;

  void changeSaleState(bool value) => _saleState.value = value;

  void resetAll() {
    _resetSaleSelection();
    _resetRateSelection();
    resetColorSelection();
    _inStockState.value = false;
    _saleState.value = false;
  }

  // navigation
  void navigateBack() => _navigationService.pop();

  void dispose() {
    _totalSaleItemsSelected.dispose();
    _totalRateItemsSelected.dispose();
    _totalColorItemsSelected.dispose();
    _inStockState.dispose();
    saleState.dispose();
  }
}
