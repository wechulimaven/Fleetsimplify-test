import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dagizo_app/shared/configs/colors.dart';

import '../configs/styles.dart';

AppBar defaultAppBar() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Palette.blackColor,
      systemNavigationBarColor: Palette.blackColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    foregroundColor: Palette.white,
    backgroundColor: Palette.white,
    // centerTitle: true,
    elevation: 0.0,
    title: Text(
      'Car management tools',
      style: Styles.defaultAppBarStyle,
    ),
  );
}

// var defaultAppBar =

var menuAppbar = AppBar(
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Palette.white,
    systemNavigationBarColor: Palette.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
  foregroundColor: Palette.white,
  backgroundColor: Palette.white,
  elevation: 0.0,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  leading: const Icon(Icons.menu),
);
