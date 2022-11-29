import 'package:dagizo_app/core/data/dummy/stepper_dummy_headers.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:flutter/material.dart';

class RectangleWidget extends StatelessWidget {
  final bool isDone;
  final int index;
  const RectangleWidget({Key? key, required this.isDone, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLine(!_isFirst(index)),
        Container(
          height: 23,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
                color: isDone ? Palette.accentColor2 : Palette.greyColor,
                width: 1.5),
          ),
          child: Center(
            child: Text(
              '$index',
              style: Styles.normalTextStyle.copyWith(
                  color: isDone ? Palette.greenColor : Palette.greyColor),
            ),
          ),
        ),
        _buildLine(!_isLast(index)),
      ],
    );
  }

  bool _isFirst(int index) {
    return index == 1;
  }

  bool _isLast(int index) {
    return inspectionList.length - 6 == index;
  }

  Widget _buildLine(bool visible) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 16.0,
      color: Colors.grey.shade300,
    );
  }
}

class Checked extends StatelessWidget {
  const Checked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 18,
        width: 18,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.greenColor,
        ),
        child: const Icon(
          Icons.check,
          color: Palette.white,
          size: 15,
        ));
  }
}
