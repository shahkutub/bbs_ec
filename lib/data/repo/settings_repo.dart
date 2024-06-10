import 'dart:convert';

import 'package:bbs_ec/data/model/finger_account.dart';
import 'package:bbs_ec/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepo {
  final SharedPreferences sharedPreferences;
  SettingsRepo({required this.sharedPreferences});

  Future<bool> saveFingerPrintData(FingerAccount finger) async {
    return await sharedPreferences.setString(
        AppConstants.FINGERPRINT_LOGIN, json.encode(finger.toJson()));
  }

  FingerAccount? getFingerPrintData() {
    String data =
        sharedPreferences.getString(AppConstants.FINGERPRINT_LOGIN) ?? '';
    if (data.isEmpty) {
      return null;
    }
    return FingerAccount.fromJson(json.decode(data));
  }

  void removeFingerPrintData() async {
    await sharedPreferences.remove(AppConstants.FINGERPRINT_LOGIN);
  }
}
