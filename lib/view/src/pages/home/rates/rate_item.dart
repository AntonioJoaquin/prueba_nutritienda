import 'package:prueba_nutritienda/core/src/common/custom_notifiers.dart';

class RateItem {
  final String value;
  final CustomValueNotifier<bool> _isSelected = CustomValueNotifier(false);

  RateItem(this.value);

  CustomValueNotifier<bool> get isSelected => _isSelected;
  void changeSelection() => _isSelected.value = !_isSelected.value;
}
