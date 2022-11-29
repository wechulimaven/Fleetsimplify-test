import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? borderColor;
  final Color textcolor;
  final Color iconColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? frontIconSize;
  final double? fontSize;
  final bool displayLoading;
  final String? frontIcon;
  final String? backIcon;

  const CustomTextButton(
      {Key? key,
      required this.text,
      this.color = Palette.yellowColor,
      this.textcolor = Palette.blackColor,
      this.iconColor = Palette.blackColor,
      required this.onTap,
      this.fontSize,
      this.frontIconSize,
      this.borderColor,
      this.frontIcon,
      this.backIcon,
      this.width,
      this.height,
      required this.displayLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? Palette.midGreyColor),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: !displayLoading
            ? Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  backIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            backIcon!,
                            color: iconColor,
                            height: frontIconSize ?? 50.h,
                          ),
                        )
                      : const SizedBox.shrink(),
                  backIcon != null ? const Spacer() : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textcolor,
                          fontSize: fontSize ?? 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Spacer(),
                  frontIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            frontIcon!,
                            // color: disabledColor,
                            height: frontIconSize ?? 50.h,
                          ),
                        )
                      : const SizedBox.shrink(),
                  frontIcon != null
                      ? SizedBox(
                          width: 10.w,
                        )
                      : const SizedBox.shrink(),
                ],
              )
            : const SpinKitThreeBounce(
                color: Colors.white,
                size: 20,
              ),
      ),
    );
  }
}
