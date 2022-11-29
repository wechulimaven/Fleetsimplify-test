// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderedButton extends StatelessWidget {
  final String btnText;
  final Icon? icon;
  final Function()? onTap;
  final Color? borderColor;
  final Color? textColor;
  final Color? fillColor;
  final double? width;
  final double? fontSize;
  const BorderedButton({
    Key? key,
    required this.btnText,
    this.icon,
    this.onTap,
    this.borderColor,
    this.textColor,
    this.fillColor,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? null,
      child: Container(
        height: 60.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor ?? Colors.grey[700]!),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : const SizedBox.shrink(),
            SizedBox(width: 7.w),
            Text(
              btnText,
              style: TextStyle(
                  fontSize: fontSize ?? 14.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor),
            ),
          ],
        )),
      ),
    );
  }
}
