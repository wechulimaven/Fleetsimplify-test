import 'package:after_layout/after_layout.dart';
import 'package:dagizo_app/core/blocs/splash_page_cubit/splash_page_cubit.dart';
import 'package:dagizo_app/core/di/injector.dart';
import 'package:dagizo_app/core/services/on_will_pop.dart';
import 'package:dagizo_app/shared/configs/assets.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/utils/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/home.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    setUpScreenUtil(context);
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => inject.get<SplashPageCubit>()..checkAuthStatus(),
      child: BlocListener<SplashPageCubit, SplashPageState>(
        listener: (context, state) {
          if (state is AuthStatus) {
            if (state.loggedIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
              // Navigator.pushNamedAndRemoveUntil(
              //     context, HomeScreen.routeName, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
              //   // context, VerifyPhonePage.routeName, (route) => false);
            }
          }
        },
        child: Scaffold(
            backgroundColor: Palette.white,
            body: WillPopScope(
              onWillPop: () => handleWillPop(context),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.7,
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Assets.logoIcon,
                      height: 132.h,
                    ),
                    // Image.asset(
                    //   Assets.logo,
                    //   height: 132.h,
                    // ),
                  ),
                ],
              )),
            )),
      ),
    );
  }
}
