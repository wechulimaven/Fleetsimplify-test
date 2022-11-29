import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dagizo_app/core/data/local/shared_preference_helper.dart';
import 'package:dagizo_app/core/di/injector.dart';
import 'package:dagizo_app/shared/utils/constants.dart';

part 'language_support_state.dart';

class LanguageSupportCubit extends Cubit<LanguageSupportState> {
  final SharedHelper sharedPreferenceService;
  LanguageSupportCubit(this.sharedPreferenceService)
      : super(LanguageSupportInitial());

  Future<void> getLocale() async {
    emit(LanguageSupportLoading());
    var locale = await sharedPreferenceService.getString(languageKey);
    if (locale == null) {
      emit(const LanguageSupportLoaded('', false));
    } else {
      emit(LanguageSupportLoaded(locale, true));
    }
  }

  Future<void> changeLocale(String val) async {
    emit(LanguageSupportLoading());
    await inject.isReady<SharedPreferences>();
    await sharedPreferenceService.saveString(languageKey, val);
    emit(LanguageSupportLoaded(val, true));
  }
}
