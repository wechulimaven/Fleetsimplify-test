import 'package:dagizo_app/shared/utils/toast_utils.dart';

DateTime? backButtonPressTime;
Future<bool> handleWillPop(context) async {
  final now = DateTime.now();
  final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
      backButtonPressTime == null ||
          now.difference(backButtonPressTime!) > const Duration(seconds: 3);

  if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
    backButtonPressTime = now;
    ToastUtils.showInfoToast('Press again to exit app');

    return false;
  }
  return true;
}
