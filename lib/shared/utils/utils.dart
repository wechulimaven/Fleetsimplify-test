// decode access token to get owner details
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dagizo_app/shared/utils/toast_utils.dart';

import '../configs/constants.dart';

Future<String?> getAppFlavor() async {
  try {
    return await const MethodChannel('com.dagizo.app')
        .invokeMethod<String>('getFlavor');
  } catch (e) {
    return Constants.production;
  }
}

// CountryCode fromCountryName(String name) {
//   final Map<String, String> jsonCode = codes.firstWhere(
//     (code) => code['name']?.toLowerCase() == name.toLowerCase(),
//   );
//   return CountryCode.fromJson(jsonCode);
// }

List<String> getFavCountries() {
  return ['+254', 'KE'];
}

String getLanguageCode(BuildContext context) {
  var languageCode = context.locale.languageCode;

  /// This must not be null. It may be 'und', representing 'undefined'.
  if (languageCode == 'und') {
    languageCode = 'en';
  }

  return languageCode;
}

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

Future<void> checkNetwork(BuildContext context) async {
  bool isOnline = await hasNetwork();

  if (!isOnline) {
    ToastUtils.showErrorToast('netConnectionError'.tr());
  }
}
