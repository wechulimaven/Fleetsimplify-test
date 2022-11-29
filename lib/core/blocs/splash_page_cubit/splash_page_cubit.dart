import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dagizo_app/core/data/local/shared_preference_helper.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  final SharedHelper sharedPreferenceService;

  SplashPageCubit(this.sharedPreferenceService) : super(SplashPageInitial());

  Future<void> checkAuthStatus() async {
    //add initialization logic here if any
    try {
      var ownerDetails = await sharedPreferenceService.getString('Key');
      await Future.delayed(const Duration(seconds: 3));
      if (ownerDetails != null) {
        emit(const AuthStatus(loggedIn: true));
      } else {
        emit(const AuthStatus(loggedIn: false));
      }
    } catch (e) {
      Fimber.e(e.toString());
      emit(const AuthStatus(loggedIn: false));
    }
  }
}
