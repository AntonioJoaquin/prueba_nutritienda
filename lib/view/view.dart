import 'package:flutter/material.dart';

import 'src/common/palette.dart';
import 'src/utils/router.dart';

abstract class View {
  /// Routing
  static Route<dynamic> getRoutes(RouteSettings settings) =>
      AppRouter.generateRoute(settings);

  static String getInitialRoute() => AppRouter.homeRoute;

  // Theme
  static ThemeData get theme => ThemeData(
        primaryColor: Palette.primaryColor,
        dividerColor: Palette.dividerColor,
        scaffoldBackgroundColor: Palette.white,
        expansionTileTheme: ExpansionTileThemeData(
          tilePadding: const EdgeInsets.fromLTRB(24.0, 4.0, 30.0, 4.0),
          iconColor: Palette.iconColor,
          collapsedIconColor: Palette.iconColor,
        ),
      );
}
