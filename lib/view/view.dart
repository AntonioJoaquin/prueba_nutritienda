import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        scaffoldBackgroundColor: Palette.white,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Palette.textColor,
          ),
          centerTitle: true,
          color: Palette.white,
          elevation: .0,
          iconTheme: IconThemeData(color: Palette.textColor),
        ),
      );
}
