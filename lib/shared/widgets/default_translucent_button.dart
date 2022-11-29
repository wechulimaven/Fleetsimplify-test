import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/size_config.dart';
import 'package:dagizo_app/shared/configs/styles.dart';

class TransButton extends StatelessWidget {
  const TransButton(
      {Key? key,
      required this.text,
      this.press,
      this.height,
      this.fontSize,
      this.displayLoading = false,
      this.loaderSize = 40.0,
      this.frontIcon,
      this.borderRadius,
      this.disable = false})
      : super(key: key);
  final String text;
  final Function()? press;
  final double? height;
  final double? fontSize;
  final double loaderSize;
  final bool displayLoading;
  final bool disable;
  final String? frontIcon;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? getProportionateScreenHeight(70),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        color: Palette.transPrimaryColor,
        disabledColor: Palette.transPrimaryColor,
        disabledTextColor: Colors.black,
        textColor: Palette.transPrimaryColor,
        onPressed: !disable ? press : null,
        child: !displayLoading
            ? (frontIcon != null)
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        frontIcon!,
                        color: Palette.transPrimaryColor,
                        height: 12.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: Styles.normalTextStyle.copyWith(
                          fontSize: getProportionateScreenWidth(fontSize ?? 20),
                          color: Palette.transPrimaryColor,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                : Text(
                    text,
                    style: Styles.normalTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(fontSize ?? 20),
                      color: Palette.transPrimaryColor,
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
