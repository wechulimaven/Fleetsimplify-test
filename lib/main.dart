// ignore_for_file: library_private_types_in_public_api

import 'package:dagizo_app/core/blocs/language_support_cubit/language_support_cubit.dart';
import 'package:dagizo_app/core/di/injector.dart';

import 'package:dagizo_app/core/services/navigation_service.dart';
import 'package:dagizo_app/feature/splash/splash_screen.dart';
import 'package:dagizo_app/shared/configs/colors.dart';
import 'package:dagizo_app/shared/configs/theme.dart';
import 'package:dagizo_app/shared/utils/bloc_observer.dart';
import 'package:dagizo_app/shared/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await setUpLocator();

  _setUpAndroidColors();

  _initBlocObserver();
}

void _setUpAndroidColors() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Palette.blueColor,
    systemNavigationBarColor: Palette.blueColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

void _initBlocObserver() {
  BlocOverrides.runZoned(
    () {
      runApp(EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
          fallbackLocale: const Locale('en', 'US'),
          useFallbackTranslations: true,
          child: const MyApp()));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

void _initFimber() {
  Fimber.plantTree(DebugTree(useColors: true));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initFimber();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider<LanguageSupportCubit>(create: (ctx) {
            return inject.get<LanguageSupportCubit>();
          }),
        ],
        child: BlocProvider(
          create: (ctx) => inject.get<LanguageSupportCubit>()..getLocale(),
          child: BlocBuilder<LanguageSupportCubit, LanguageSupportState>(
              builder: (ctx, state) {
            return MaterialApp(
                builder: (context, widget) {
                  return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget!);
                },
                title: 'Fleet Simplify',
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                initialRoute: SplashPage.routeName,
                theme: theme(),
                locale: state is LanguageSupportLoaded
                    ? (state.hasCustomLanguage
                        ? Locale(state.language, '')
                        : null)
                    : null,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                routes: routes);
          }),
        ),
      ),
    );
  }
}
