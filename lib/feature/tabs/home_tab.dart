import 'package:dagizo_app/feature/tabs/widgets/stepper.dart';
import 'package:dagizo_app/shared/configs/assets.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/data/dummy/chip_dummy_model.dart';
import '../../core/data/dummy/stepper_dummy_headers.dart';
import '../../shared/widgets/custom_text_button.dart';
import '../../shared/widgets/default_appbar.dart';
import '../inspection/inspection_home.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int index = 1;
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: defaultAppBar(),
          body: Column(
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(color: Palette.midGreyColor),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: chipList
                          .asMap()
                          .map(
                            (i, e) => MapEntry(
                              i,
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = i;
                                    });
                                  },
                                  child: tabWidget(e.label, e.asset,
                                      i == index ? true : false)),
                            ),
                          )
                          .values
                          .toList()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(26.0.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'It takes 5 steps and less than 2 minutes to inspect your car. ',
                      textAlign: TextAlign.center,
                      style: Styles.normalTextStyle,
                    ),
                    SizedBox(height: 30.h),
                    CustomStepper(
                      // type: StepperType.vertical,
                      currentStep: currentStep,
                      steps: headersList
                          .map((e) => _buildStep(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    e.title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Palette.steperGreyColor),
                                  ),
                                ),
                                // isActive: i == currentStep,
                                // state: StepState.error,
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 50.h),
                    CustomTextButton(
                      text: 'Let’s begin  inspecting',
                      onTap: () {
                        Navigator.pushNamed(context, InpectionScreen.routeName);
                      },
                      displayLoading: false,
                      frontIcon: Assets.forward,
                      frontIconSize: 15,
                      fontSize: 15,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget tabWidget(String title, String asset, bool selcted) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: selcted ? Palette.accentColor : Palette.lightGreyColor,
          border: Border.all(color: Palette.lightGreyColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 40.h,
        width: 145.w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            SvgPicture.asset(
              asset,
              semanticsLabel: title.tr(),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              title,
              style: Styles.normalTextStyle,
            ),
          ]),
        ),
      ),
    );
  }

  CustomStep _buildStep({
    required Widget title,
    CustomStepState state = CustomStepState.indexed,
    bool isActive = false,
  }) {
    return CustomStep(
        title: title,
        subtitle: const Text('Subtitle'),
        state: state,
        isActive: isActive,
        content: const SizedBox.shrink());
  }
}
