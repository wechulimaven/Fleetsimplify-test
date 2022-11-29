import 'package:dagizo_app/core/data/dummy/stepper_dummy_headers.dart';
import 'package:dagizo_app/feature/home/home.dart';
import 'package:dagizo_app/feature/inspection/widgets/rectangle_widget.dart';
import 'package:dagizo_app/shared/configs/size_config.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/blocs/inspection/inspection_cubit.dart';
import '../../shared/configs/assets.dart';
import '../../shared/configs/colors.dart';
import '../../shared/configs/styles.dart';
import '../../shared/widgets/custom_text_button.dart';
import '../terms/terms_home.dart';
import 'inspection_home.dart';

class HandoverScreen extends StatefulWidget {
  static const routeName = 'HandoverScreen';
  const HandoverScreen({Key? key}) : super(key: key);

  @override
  State<HandoverScreen> createState() => _HandoverScreenState();
}

class _HandoverScreenState extends State<HandoverScreen> {
  List<InspectionModel> inspectionListData = [];

  loadData() async {
    List<InspectionModel> inspectionList =
        await context.read<InspectionCubit>().getSavedProgressList() ?? [];
    Fimber.e('${inspectionList[3].isAvailable}');
    setState(() {
      inspectionListData = inspectionList;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Palette.lightGreyColor,
        title: Text(
          'Hand Over Inspection Form',
          style: Styles.normalTextStyle.copyWith(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight + 547,
          child: Column(
            children: [
              Container(
                // height: SizeConfig.screenWidth * 0.7,
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.inspection,
                  height: SizeConfig.screenWidth * 0.6,
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Egestas rhoncus nisl vivamus condimentum.',
                  textAlign: TextAlign.center,
                  style: Styles.normalTextStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 30.0.sm),
                child: Column(
                  children: [
                    Row(
                      children: inspectionListData
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18),
                                child: e.isAvailable != null
                                    ? const Checked()
                                    : const SizedBox(
                                        height: 18,
                                        width: 18,
                                      ),
                              ))
                          .toList(),
                    ),
                    // SizedBox(
                    //   width: 100,
                    //   height:100,
                    //   child: ListView(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     // physics: widget.physics,
                    //     children: <Widget>[
                    //       for (int i = 0; i < inspectionList.length; i += 1)
                    //         Column(
                    //           // key: inspectionList[i].assetFile,
                    //           children: <Widget>[
                    //             RectangleWidget(
                    //                 isDone: inspectionList[i].isAvailable,
                    //                 index: inspectionList[i].index),
                    //             // _buildVerticalBody(i),
                    //           ],
                    //         ),
                    //     ],
                    //   ),
                    // )
                    Row(
                      children: inspectionListData
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: RectangleWidget(
                                    isDone: e.isAvailable != null,
                                    index: e.index),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(58.0),
                child: CustomTextButton(
                  text: inspectionListData[4].isAvailable != null
                      ? 'Submit'
                      : 'Go to next section',
                  onTap: () {
                    if (inspectionListData[4].isAvailable == null) {
                      InspectionModel data = inspectionListData
                          .firstWhere((element) => element.isAvailable == null);
                      Navigator.pushReplacementNamed(
                          context, InpectionScreen.routeName,
                          arguments: {'step': data});
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        TermsHome.routeName,
                      );
                    }
                  },
                  displayLoading: false,
                  frontIcon: Assets.forward,
                  frontIconSize: 15,
                  color: Palette.yellowColor,
                  fontSize: 15,
                  width:
                      inspectionListData[4].isAvailable != null ? 140.w : null,
                  height: 50.h,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: SizeConfig.screenHeight,
                color: Palette.accentColor2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Mauris morbi natoque sit leo. Lectus aenean non tempus feugiat consequat. Tristique a.',
                        textAlign: TextAlign.center,
                        style: Styles.normalTextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Palette.white),
                      ),
                    ),
                    CustomTextButton(
                      text: 'Skip & continue later',
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      displayLoading: false,
                      // frontIcon: Assets.forward,
                      frontIconSize: 15,
                      color: Palette.white,
                      fontSize: 15,
                      width: 200.w,
                      height: 50.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
