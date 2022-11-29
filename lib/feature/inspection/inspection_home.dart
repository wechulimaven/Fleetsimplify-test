// ignore_for_file: use_build_context_synchronously

import 'package:dagizo_app/feature/inspection/handover_inspection.dart';
import 'package:dagizo_app/feature/inspection/widgets/custom_slider.dart';
import 'package:dagizo_app/feature/inspection/widgets/dot_widget.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/size_config.dart';
import 'package:dagizo_app/shared/configs/styles.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:ui' as ui;

import '../../core/blocs/inspection/inspection_cubit.dart';
import '../../core/data/dummy/stepper_dummy_headers.dart';
import '../../shared/configs/assets.dart';
import '../../shared/widgets/custom_text_button.dart';

class InpectionScreen extends StatefulWidget {
  static const routeName = 'InpectionScreen';
  const InpectionScreen({Key? key}) : super(key: key);

  @override
  State<InpectionScreen> createState() => _InpectionScreenState();
}

class _InpectionScreenState extends State<InpectionScreen> {
  int activeStep = 0;
  // Availability? character = Availability.Nill;
  InspectionModel? inspectionModel;
  List<InspectionModel> inspectionListModel = [];
  final double _currentSliderValue = 30.0;
  final List<String> value = ['Yes', 'No'];
  String? selectedValue;

  final List<double> values = [
    1.0,
    2.0,
    3.0,
    4.0,
    5.0,
  ];
  int selectedIndex = 0;
  ui.Image? customImage;

  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: 18, targetWidth: 18);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  loadData() async {
    List<InspectionModel> inspectionList =
        await context.read<InspectionCubit>().getSavedProgressList() ?? [];
    setState(() {
      inspectionListModel = inspectionList;
    });
  }

  @override
  void initState() {
    load('assets/icons/slider.png').then((image) {
      setState(() {
        customImage = image;
      });
    });
    loadData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      inspectionModel = args['step'] as InspectionModel;
    }

    super.didChangeDependencies();
  }

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
          Center(
            child: Text(
              'Items Availability & functionality',
              textAlign: TextAlign.center,
              style: Styles.normalTextStyle,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            // scrollDirection: Axis.horizontal,
            children: inspectionList
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DotWidget(
                      isDone: e.isAvailable ?? false,
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 28.0.sm, right: 28.sm),
            child: Container(
              decoration: BoxDecoration(
                color: Palette.lightGreyColor,
                border: Border.all(color: Palette.greyColor),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
              ),
              height: SizeConfig.screenHeight * 0.54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.brownColor,
                      border: Border.all(color: Palette.greyColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Palette.blackColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                                child: Text(
                              '${inspectionModel?.index}',
                              style: Styles.normalTextStyle
                                  .copyWith(color: Palette.white),
                            )),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '${inspectionModel?.title}',
                            style: Styles.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 38.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset('${inspectionModel?.assetFile}'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Is it available?',
                          textAlign: TextAlign.center,
                          style: Styles.normalTextStyle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Row(
                                  children: value
                                      .map((e) => InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedValue = e;
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    e,
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        Styles.normalTextStyle,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: selectedValue !=
                                                                    null &&
                                                                selectedValue ==
                                                                    e
                                                            ? Palette.greenColor
                                                            : Palette
                                                                .greyColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                      .toList()),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              border: Border.all(color: Palette.midGreyColor),
                            ),
                            child: Center(
                              child: Text(
                                'Very poor functionality',
                                style: Styles.normalTextStyle.copyWith(
                                    color: Palette.greenColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  inactiveTrackColor: Colors.blue,
                                  trackShape: GradientSliderTrackShape(
                                    linearGradient: const LinearGradient(
                                        colors: [
                                          Palette.greenColor,
                                          Palette.greenColor
                                        ]),
                                  ),
                                  trackHeight: 16.0,
                                  overlayColor: Colors.purple.withAlpha(36),
                                  // trackShape:SliderTrackShape()
                                  thumbShape: customImage != null
                                      ? SliderThumbImage(customImage!)
                                      : const RoundSliderThumbShape()),
                              child: Slider(
                                value: selectedIndex.toDouble(),
                                min: 0.0,
                                max: 5.0,
                                // onChangeStart: (double value) {
                                //   print('Start value is $value');
                                // },
                                // onChangeEnd: (double value) {
                                //   print('Finish value is $value');
                                // },
                                onChanged: (double newValue) {
                                  setState(() {
                                    selectedIndex = newValue.toInt();
                                  });
                                },
                                activeColor: Palette.greenColor,
                                inactiveColor: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    List.generate(6, (index) => Text("$index")),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'Very poor functionality',
                                    style: Styles.normalTextStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'Great functionality',
                                    style: Styles.normalTextStyle.copyWith(
                                        color: selectedIndex >= 4
                                            ? Palette.greenColor
                                            : null,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 38.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<InspectionCubit, InspectionState>(
                  listener: (context, state) async {
                    Fimber.e('$state');
                    if (state is InspectionSuccess) {
                      List<InspectionModel> inspectionList = await context
                              .read<InspectionCubit>()
                              .getSavedProgressList() ??
                          [];

                      Navigator.pushNamed(context, HandoverScreen.routeName,
                          arguments: {'inspectionList': inspectionList});
                    }
                  },
                  builder: (context, state) {
                    return CustomTextButton(
                      text: 'Back',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      displayLoading: false,
                      backIcon: Assets.backward,
                      frontIconSize: 15,
                      color: Palette.greyColor,
                      fontSize: 15,
                      width: 110.w,
                      height: 50.h,
                    );
                  },
                ),
                CustomTextButton(
                  text: 'Next',
                  onTap: () {
                    InspectionModel? model;
                    for (int i = 0; i < inspectionListModel.length; i++) {
                      if (inspectionListModel[i].title ==
                          inspectionModel!.title) {
                        inspectionListModel[i].isAvailable =
                            selectedValue == 'Yes' ? true : false;
                        inspectionListModel[i].level = selectedIndex;
                        model = inspectionListModel[i];
                      }
                    }
                    inspectionListModel.removeAt(model!.index - 1);
                    inspectionListModel.insert(model.index - 1, model);
                    context
                        .read<InspectionCubit>()
                        .saveProgress(inspectionListModel);
                  },
                  displayLoading: false,
                  frontIcon: Assets.forward,
                  frontIconSize: 15,
                  color: selectedValue == null
                      ? Palette.greyColor
                      : Palette.yellowColor,
                  fontSize: 15,
                  width: 115.w,
                  height: 50.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
