import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Rubik',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecoration borderlessDecorationTheme(hinText) {
  return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(10),
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: hinText);
}

InputDecoration dropDownFormFieldDecoration() {
  return const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.all(12),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ));
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Palette.primaryTextColor.withOpacity(0.2)),
  );

  var focusedlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Palette.blackColor),
  );

  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: const TextStyle(color: Palette.secondaryTextColor),
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: Palette.primaryTextColor),
    bodyText2: TextStyle(color: Palette.primaryTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(color: Palette.primaryTextColor, fontSize: 18),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: Palette.primaryTextColor, fontSize: 18),
    ).headline6,
  );
}
