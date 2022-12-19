import 'common/palette.dart';
import 'pages/home/colors/color_item.dart';
import 'pages/home/rates/rate_item.dart';
import 'pages/home/sales/sale_item.dart';

abstract class StaticData {
  static final saleItems = <SaleItem>[
    SaleItem('Limited-Time Special (33)'),
    SaleItem('Clearance/closeout (113)'),
    SaleItem('Last Act (11)'),
    SaleItem('Sales & Discounts (162)'),
  ];

  static final rateItems = <RateItem>[
    RateItem('1'),
    RateItem('2'),
    RateItem('3'),
    RateItem('4'),
    RateItem('5'),
  ];

  static final colorItems = <ColorItem>[
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
}
