import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dagizo_app/shared/configs/colors.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool isOptional;
  var validator;

  LabelFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.textInputType,
    this.prefixIcon,
    this.maxLength,
    this.isPasswordField = false,
    this.inputFormatters,
    this.isOptional = true,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                text: label,
                style: Styles.normalTextStyle,
                children: const [
                  // TextSpan(
                  //   text: isOptional ? "(Optional)" : ' *',
                  //   style: TextStyle(
                  //     color: isOptional ? Palette.gray : Colors.red,
                  //   ),
                  // )
                ]),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
              obscureText: isPasswordField,
              obscuringCharacter: '*',
              controller: controller,
              keyboardType: textInputType,
              style: Styles.inputTextStyle,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              validator: validator,
              // decoration:
              // InputDecoration(
              //   hintText: hintText,
              //   hintStyle: Styles.hintTextStyle,
              //   focusedBorder: _focusedBorder,
              //   enabledBorder: _enabledBorder,
              // ),
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                hintText: hintText,
                hintStyle: Styles.hintLoginTextStyle,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                suffixIconConstraints: BoxConstraints(maxWidth: 50.w),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide:
                      BorderSide(color: Palette.blackColor, width: 1.0),
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
                  borderSide:
                      BorderSide(color: Palette.primaryTextColor, width: 1.0),
                ),
              )),
        ],
      ),
    );
  }
}
