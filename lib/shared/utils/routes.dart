import 'package:dagizo_app/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dagizo_app/core/data/local/shared_preference_helper.dart';
import 'package:dagizo_app/core/di/injector.dart';

import '../../feature/home/home.dart';
import '../../feature/inspection/handover_inspection.dart';
import '../../feature/inspection/inspection_home.dart';
import '../../feature/terms/terms_home.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => myRoute(SplashPage()),
  HomeScreen.routeName: (context) => myRoute(const HomeScreen()),
  InpectionScreen.routeName: (context) => myRoute(const InpectionScreen()),
  HandoverScreen.routeName: (context) => myRoute(const HandoverScreen()),
  TermsHome.routeName: (context) => myRoute(const TermsHome()),
};

//set icon colors to black and status bar colors to white for Android.
Widget myRoute(var widget) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    child: widget,
  );
}

class GlobalNavigationService {
  Future<dynamic> logOutUser(String route) async {
    await inject<SharedHelper>().clearStorage();
    return navigationKey.currentState!
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static void goback() {
    return navigationKey.currentState!.pop();
  }
}
