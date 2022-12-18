import 'dart:ui';

import 'package:prueba_nutritienda/core/src/common/custom_notifiers.dart';

class ColorItem {
  final Color color;
  final String name;
  final CustomValueNotifier<bool> _isSelected = CustomValueNotifier(false);

  ColorItem(this.color, this.name);

  CustomValueNotifier<bool> get isSelected => _isSelected;
  void changeSelection() => _isSelected.value = !_isSelected.value;
}
