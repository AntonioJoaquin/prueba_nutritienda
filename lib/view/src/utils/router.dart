import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return _fadeRoute(const SplashPage(), splashRoute);

      default:
        return _fadeRoute(HomePage(), homeRoute);
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) =>
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => child,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, ___) => Platform.isAndroid
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                linearTransition: true,
                child: child,
              ),
      );
}
