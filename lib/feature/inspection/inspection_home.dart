import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InpectionScreen extends StatefulWidget {
  static const routeName = 'InpectionScreen';
  const InpectionScreen({Key? key}) : super(key: key);

  @override
  State<InpectionScreen> createState() => _InpectionScreenState();
}

class _InpectionScreenState extends State<InpectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Palette.lightGreyColor,
        title: Text(
          'Simple form > Items availability',
          style: Styles.normalTextStyle.copyWith(fontSize: 17),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Items Availability & functionality',
            textAlign: TextAlign.center,
            style: Styles.normalTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              color: Palette.lightGreyColor,
              border: Border.all(color: Palette.lightGreyColor),
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 40.h,
            width: 145.w,
          )
        ],
      ),
    );
  }
}
