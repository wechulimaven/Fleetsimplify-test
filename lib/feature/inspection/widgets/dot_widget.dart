import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final bool isDone;
  const DotWidget({Key? key, required this.isDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDone ? Palette.greenColor : Palette.greyColor),
    );
  }
}
