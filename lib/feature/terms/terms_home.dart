import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../core/services/on_will_pop.dart';
import '../../shared/configs/colors.dart';

class TermsHome extends StatefulWidget {
  static const routeName = 'TermsHome';
  const TermsHome({Key? key}) : super(key: key);

  @override
  State<TermsHome> createState() => _TermsHomeState();
}

class _TermsHomeState extends State<TermsHome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Palette.lightGreyColor,
          title: Text(
            'Accept Terms',
            style: Styles.normalTextStyle.copyWith(fontSize: 17),
          ),
        ),
        body: Center(
          child: Container(
            child: Text(
              'Terms Coming soon',
              style: Styles.normalTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
