import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/size_config.dart';
import 'package:dagizo_app/shared/configs/styles.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      required this.text,
      this.press,
      this.height,
      this.hasBackground = true,
      this.fontSize,
      this.displayLoading = false,
      this.loaderSize = 40.0,
      this.frontIcon,
      this.textColor,
      this.disabledColor = Palette.white,
      this.disable = false})
      : super(key: key);
  final String text;
  final Function()? press;
  final double? height;
  final bool hasBackground;
  final double? fontSize;
  final double loaderSize;
  final bool displayLoading;
  final bool disable;
  final Color disabledColor;
  final Color? textColor;
  final String? frontIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? getProportionateScreenHeight(60),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 2, color: disabledColor)),
        color: Colors.white,
        disabledColor: disabledColor,
        disabledTextColor: Colors.black,
        textColor: disabledColor,
        onPressed: !disable ? press : null,
        child: !displayLoading
            ? (frontIcon != null)
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      SvgPicture.asset(
                        frontIcon!,
                        color: disabledColor,
                        height: 12.h,
                      ),
                      const SizedBox(),
                      Expanded(
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: Styles.normalTextStyle.copyWith(
                            fontSize:
                                getProportionateScreenWidth(fontSize ?? 18),
                            color: disabledColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: Styles.normalTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(fontSize ?? 18),
                      color: textColor ?? disabledColor,
                    ),
                  )
            : SpinKitThreeBounce(
                color: Colors.white,
                size: loaderSize,
              ),
      ),
    );
  }
}
