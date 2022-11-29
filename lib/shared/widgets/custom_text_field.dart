import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? padding;
  final double? wordSpacing;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const CustomTextWidget(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.padding,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.wordSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: padding ?? 8.0.sm),
        child: Text(
          text,
          style: TextStyle(
              color: color ?? Colors.black,
              fontSize: fontSize ?? 12.0,
              wordSpacing: wordSpacing,
              fontWeight: fontWeight),
          textAlign: textAlign,
        ));
  }
}
