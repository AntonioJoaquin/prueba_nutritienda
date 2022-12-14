import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setUpLocator() {
  $initGetIt(locator);
}

GlobalKey<NavigatorState> navigatorKeyBuilder(
    GlobalKey<NavigatorState> navigatorKey) {
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);

  return navigatorKey;
}

void initScreenUtil(BuildContext context) {
  ScreenUtil.init(context);
}
