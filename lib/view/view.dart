import 'package:flutter/widgets.dart';

import 'src/utils/router.dart';

abstract class View {
  /// Routing
  static Route<dynamic> getRoutes(RouteSettings settings) =>
      AppRouter.generateRoute(settings);

  static String getInitialRoute() => AppRouter.homeRoute;
}
