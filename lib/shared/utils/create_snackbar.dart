import 'package:flutter/material.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/styles.dart';

ScaffoldFeatureController createSnack(BuildContext context, String txt) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Palette.transPrimaryColor,
      content: Text(txt, style: Styles.snackTextStyle),
    ),
  );
}
