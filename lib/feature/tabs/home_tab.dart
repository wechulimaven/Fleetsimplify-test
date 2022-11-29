// ignore_for_file: prefer_is_empty

import 'package:dagizo_app/core/blocs/inspection/inspection_cubit.dart';
import 'package:dagizo_app/feature/tabs/widgets/stepper.dart';
import 'package:dagizo_app/feature/terms/terms_home.dart';
import 'package:dagizo_app/shared/configs/assets.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:dagizo_app/shared/utils/toast_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/data/dummy/chip_dummy_model.dart';
import '../../core/data/dummy/stepper_dummy_headers.dart';
import '../../core/di/injector.dart';
import '../../shared/widgets/custom_text_button.dart';
import '../../shared/widgets/default_appbar.dart';
import '../inspection/handover_inspection.dart';
import '../inspection/inspection_home.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int index = 1;
  int currentStep = 0;
  bool? isStarted;
  InspectionModel? inspectionModel;
  List<InspectionModel> inspectionListModel = [];

  load() {}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                                  Fimber.e('Selected');
                                  if (inspectionListModel[4].isAvailable !=
                                          null &&
                                      i == 4) {
                                    Navigator.popAndPushNamed(
                                        context, TermsHome.routeName);
                                  }
                                },
                                child: tabWidget(
                                  e.label,
                                  e.asset,
                                  i == index ? true : false,
                                ),
                              ),
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
                    BlocProvider(
                      create: (context) =>
                          inject<InspectionCubit>()..checkStatus(),
                      child: BlocConsumer<InspectionCubit, InspectionState>(
                        listener: (context, state) async {
                          if (state is InspectionStatus) {
                            setState(() {
                              isStarted = state.isStarted;
                            });
                            inspectionListModel = await context
                                    .read<InspectionCubit>()
                                    .getSavedProgressList() ??
                                [];
                          }
                        },
                        builder: (context, state) {
                          return CustomStepper(
                              // type: StepperType.vertical,
                              onStepTapped: (step) {
                                Fimber.d('STEPPED $step');
                                if (isStarted == null || !isStarted!) {
                                  setState(() {
                                    currentStep = step;
                                    isStarted = true;
                                    inspectionModel = inspectionList[step];
                                  });
                                  context.read<InspectionCubit>().saveStatus();
                                } else {
                                  if (inspectionListModel[step].index == 5) {
                                    Navigator.pushNamed(
                                      context,
                                      HandoverScreen.routeName,
                                    );
                                  }
                                  if (inspectionListModel[step].isAvailable !=
                                      null) {
                                    return ToastUtils.showInfoToast(
                                        'Progress already saved Proceed to next');
                                  }
                                  setState(() {
                                    currentStep = step;
                                    isStarted = true;
                                    inspectionModel = inspectionListModel[step];
                                  });
                                  if (inspectionListModel.length > 1) {
                                    context
                                        .read<InspectionCubit>()
                                        .saveProgress(inspectionListModel);
                                  }
                                }
                              },
                              currentStep: currentStep,
                              steps: [
                                if (inspectionListModel.length == 0)
                                  for (var i = 0;
                                      i < inspectionList.length;
                                      ++i)
                                    _buildStep(
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          inspectionList[i].title,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: isStarted == null ||
                                                      !isStarted!
                                                  ? Palette.steperGreyColor
                                                  : i == currentStep
                                                      ? Palette.white
                                                      : Palette
                                                          .steperGreyColor),
                                        ),
                                      ),
                                      isActive: isStarted == null || !isStarted!
                                          ? false
                                          : i == currentStep,
                                    ),
                                if (inspectionListModel.length > 3)
                                  for (var i = 0;
                                      i < inspectionListModel.length;
                                      ++i)
                                    inspectionListModel[i].isAvailable !=
                                                null &&
                                            isStarted != null
                                        ? _buildStep(
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                inspectionListModel[i].title,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.white),
                                              ),
                                            ),
                                            isActive: true)
                                        : _buildStep(
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                inspectionList[i].title,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: isStarted == null ||
                                                            !isStarted!
                                                        ? Palette
                                                            .steperGreyColor
                                                        : i == currentStep
                                                            ? Palette.white
                                                            : Palette
                                                                .steperGreyColor),
                                              ),
                                            ),
                                            isActive:
                                                isStarted == null || !isStarted!
                                                    ? false
                                                    : i == currentStep,
                                          ),
                                // _buildStep(
                                //   title: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Text(
                                //       inspectionList[i].title,
                                //       style: TextStyle(
                                //           fontSize: 15,
                                //           color: isStarted == null ||
                                //                   !isStarted!
                                //               ? Palette.steperGreyColor
                                //               : i == currentStep
                                //                   ? Palette.white
                                //                   : Palette
                                //                       .steperGreyColor),
                                //     ),
                                //   ),
                                //   isActive: isStarted == null || !isStarted!
                                //       ? false
                                //       : i == currentStep,
                                // ),
                              ]);
                        },
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomTextButton(
                      text: isStarted == null || !isStarted!
                          ? 'Let’s begin  inspecting'
                          : 'Let’s continue where we left',
                      onTap: () {
                        if (inspectionModel?.index != null) {
                          inspectionModel!.index == 5
                              ? Navigator.pushNamed(
                                  context,
                                  HandoverScreen.routeName,
                                )
                              : Navigator.pushNamed(
                                  context, InpectionScreen.routeName,
                                  arguments: {'step': inspectionModel});
                        } else {
                          ToastUtils.showInfoToast(
                              'kindly select your next step, before proceeding');
                        }
                      },
                      displayLoading: false,
                      frontIcon: Assets.forward,
                      color: isStarted == null || !isStarted!
                          ? Palette.midGreyColor
                          : Palette.yellowColor,
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
