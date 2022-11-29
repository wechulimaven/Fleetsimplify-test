import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/styles.dart';

class Decorations {
  static InputDecoration getNoBorderInputDecoration() {
    return const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.only(left: 0));
  }

  static InputDecoration getLightInputDecoration(
      {required BuildContext context}) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3.0)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Palette.errorTextColor,
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Palette.errorTextColor,
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3.0)),
        isDense: true,
        contentPadding: const EdgeInsets.all(10.0),
        errorStyle: const TextStyle(color: Palette.errorTextColor),
        suffixIconConstraints: BoxConstraints.tight(const Size(40.0, 16.0)));
  }

  static InputDecoration disabledInputDecoration(
          {required BuildContext context}) =>
      InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.w, 11.h, 8.w, 10.h),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Palette.accentColor,
                  width: 1.0,
                  style: BorderStyle.solid)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Palette.accentColor,
                  width: 1.0,
                  style: BorderStyle.solid)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Palette.accentColor,
                  width: 1.0,
                  style: BorderStyle.solid)),
          isDense: true);

  static InputDecoration replacementLightInput(
          {required BuildContext context}) =>
      InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.white, width: .8, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.white, width: .8, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(2.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.white, width: .8, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(2.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Palette.errorTextColor,
                  width: .8,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(2.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Palette.errorTextColor,
                  width: .8,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(2.0)));

  static InputDecoration passwordInputDecoration(
          {String? error,
          required VoidCallback onTap,
          String? labelText,
          bool showPassword = false}) =>
      InputDecoration(
        errorText: error,
        isDense: true,
        labelText: labelText,
        hintText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: Styles.hintLoginTextStyle,
        suffixIconConstraints: BoxConstraints(maxWidth: 50.w),
        suffixIcon: Transform.translate(
            offset: Offset(-10.w, 0),
            child: InkWell(
                onTap: onTap,
                child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Palette.secondaryTextColor,
                    size: 20.w))),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Palette.blackColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Palette.secondaryTextColor, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Palette.primaryTextColor, width: 1.0),
        ),
      );

  static InputDecoration outlineInputDecoration({
    String? error,
    required VoidCallback onTap,
    String? labelText,
    Icon? icon,
  }) =>
      InputDecoration(
        errorText: error,
        isDense: true,
        labelText: labelText,
        hintText: labelText,
        labelStyle: Styles.hintLoginTextStyle,
        hintStyle: Styles.hintLoginTextStyle,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: 50.w),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.blackColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.gray, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.primaryTextColor, width: 1.0),
        ),
      );
}
