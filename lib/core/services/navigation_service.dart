import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  Future<Object?> navigateTo(String routeName,
      {bool clearBackStack = false}) async {
    Object? pop;
    if (clearBackStack) {
      pop = await navigatorKey.currentState
          ?.pushNamedAndRemoveUntil('routeName', (route) => false);
    } else {
      pop = await navigatorKey.currentState?.pushNamed(routeName);
    }

    return pop;
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
