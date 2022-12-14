import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'di/locator.dart';
import 'view/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  setUpLocator();
  await ScreenUtil.ensureScreenSize();
  final navigatorKey = navigatorKeyBuilder(GlobalKey<NavigatorState>());

  runApp(MyApp(navigatorKey));
}

class MyApp extends StatelessWidget {
  const MyApp(this._navigatorKey, {super.key});

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        title: 'Material App',
        navigatorKey: _navigatorKey,
        onGenerateRoute: View.getRoutes,
        initialRoute: View.getInitialRoute(),
      ),
    );
  }
}
