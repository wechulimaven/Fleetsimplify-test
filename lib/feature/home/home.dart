import 'package:dagizo_app/core/blocs/home_bottom_nav/home_tab_navigation_bloc.dart';
import 'package:dagizo_app/core/blocs/home_bottom_nav/home_tab_navigation_event.dart';

import 'package:dagizo_app/shared/configs/assets.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tabs/calculate_tab.dart';
import '../tabs/home_tab.dart';
import '../tabs/recruitment_tab.dart';
import '../tabs/terms_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? orderOn = false;

  List getTabs() {
    return [
      const HomeTab(),
      const CalculateTab(),
      const TermsTab(),
      const RecruitmentTab()
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, int>(builder: (context, state) {
        return Scaffold(
            // bottomSheet: orderOn! ? const OrderProgressBottomSheet() : null,
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey,
                selectedItemColor: Palette.yellowColor,
                unselectedItemColor: Colors.white,
                onTap: (index) {
                  BlocProvider.of<BottomNavBloc>(context)
                      .add(NavigateToAnotherTab(index));
                },
                currentIndex: state,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.home,
                          color:
                              state != 0 ? Colors.white : Palette.yellowColor,
                          semanticsLabel: 'Home'.tr()),
                      label: 'Home'.tr()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.rate,
                          color:
                              state != 1 ? Colors.white : Palette.yellowColor,
                          semanticsLabel: 'Rate a driver'),
                      label: 'Rate a driver'.tr()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.business,
                          color:
                              state != 2 ? Colors.white : Palette.yellowColor,
                          semanticsLabel: 'Business'),
                      label: 'Business'.tr()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.recruitment,
                          color:
                              state != 2 ? Colors.white : Palette.yellowColor,
                          semanticsLabel: 'Recruitment'),
                      label: 'Recruitment'.tr()),
                ]),
            body: getTabs()[state]);
      }),
    );
  }
}
