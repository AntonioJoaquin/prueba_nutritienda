import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigationService(this._navigatorKey);

  Future pushNamed<T>(String routeName) async {
    try {
      return _navigatorKey.currentState?.pushNamed(routeName);
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Exception occurred in navigationTo: $error');
      }
    }
  }

  Future pushNamedAndRemoveUntil<T>(String routeName) async {
    try {
      return _navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(routeName, (route) => false);
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Exception occurred in navigationTo: $error');
      }
    }
  }

  Future pop() async {
    try {
      return _navigatorKey.currentState?.pop();
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Exception occurred in navigationTo: $error');
      }
    }
  }
}
