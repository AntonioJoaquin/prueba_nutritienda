import 'package:prueba_nutritienda/core/src/common/custom_notifiers.dart';

class SaleItem {
  final String title;
  final CustomValueNotifier<bool> _isSelected = CustomValueNotifier(false);

  SaleItem(this.title);

  CustomValueNotifier<bool> get isSelected => _isSelected;
  void changeSelection() => _isSelected.value = !_isSelected.value;
}
