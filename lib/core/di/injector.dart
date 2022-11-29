import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dagizo_app/core/blocs/language_support_cubit/language_support_cubit.dart';
import 'package:dagizo_app/core/blocs/splash_page_cubit/splash_page_cubit.dart';
import 'package:dagizo_app/core/data/local/shared_preference_helper.dart';

import '../services/navigation_service.dart';

GetIt inject = GetIt.instance;

Future<void> setUpLocator() async {
  // local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerSingleton<SharedHelper>(
      SharedHelperImpl(sharedPreferences: inject()));

  // servicesA
  inject.registerSingleton(NavigationService());

  // api

  // blocs
  inject.registerFactory<LanguageSupportCubit>(
      () => LanguageSupportCubit(inject()));
  inject.registerFactory<SplashPageCubit>(() => SplashPageCubit(inject()));
}
