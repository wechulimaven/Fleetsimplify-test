import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dagizo_app/shared/utils/routes.dart';

enum SnackTypes { success, error, information }

class CustomSnack {
  // error snack
  static void error(String? message, BuildContext ctx,
      {bool overlayBottomSheet = false}) {
    snack(SnackTypes.error, message, ctx,
        overlayBottomSheet: overlayBottomSheet);
  }

  static void success(String message, BuildContext ctx,
      {bool overlayBottomSheet = false}) {
    snack(SnackTypes.success, message, ctx,
        overlayBottomSheet: overlayBottomSheet);
  }

  static void info(String message, BuildContext ctx,
      {bool overlayBottomSheet = false}) {
    snack(SnackTypes.information, message, ctx,
        overlayBottomSheet: overlayBottomSheet);
  }

  static void snack(SnackTypes type, String? message, BuildContext ctx,
      {bool overlayBottomSheet = false}) {
    final scaffold = ScaffoldMessenger.of(navigationKey.currentContext ?? ctx);

//Snackbar show bellow modal bottom sheet
//issue https://github.com/flutter/flutter/issues/80934
    if (overlayBottomSheet) {
      Fluttertoast.showToast(
          msg: '$message',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: snackProperties(type)['color'],
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      scaffold.showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: snackProperties(type)['color'],
          content: Row(
            children: [
              Icon(
                snackProperties(type)['icon'],
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(child: Text(message!))
            ],
          ),
        ),
      );
    }
  }

  static Map snackProperties(SnackTypes types) {
    var sProperties = {};
    switch (types) {
      case SnackTypes.error:
        sProperties['color'] = Colors.red;
        sProperties['icon'] = Icons.error;
        break;
      case SnackTypes.information:
        sProperties['color'] = Colors.orange;
        sProperties['icon'] = Icons.info;
        break;
      case SnackTypes.success:
        sProperties['color'] = Colors.green;
        sProperties['icon'] = Icons.done;
        break;
      default:
        throw 'Select snack type';
    }
    return sProperties;
  }
}
