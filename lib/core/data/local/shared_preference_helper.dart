// ignore_for_file: constant_identifier_names, unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dagizo_app/core/di/injector.dart';

const String isStarted = 'is_started';
const String inspections = 'inspection_list';

abstract class SharedHelper {
  Future<SharedPreferences> getInstance();
  Future<bool> saveString(String key, String value);
  Future<bool> saveBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<String?> getString(String key);
  Future<bool> clearStorage();

  // Future saveProgress(User userResponse);
  // Future<User?> getUsersData();
}

class SharedHelperImpl extends SharedHelper {
  final SharedPreferences sharedPreferences;

  SharedHelperImpl({required this.sharedPreferences});

  @override
  Future<SharedPreferences> getInstance() async {
    await inject.allReady();
    return inject.get<SharedPreferences>();
  }

  @override
  Future<bool> saveString(String key, String value) async {
    return sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    return sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return sharedPreferences.getBool(key) ?? false;
  }

  @override
  Future<String?> getString(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> clearStorage() async {
    return await sharedPreferences.clear();
  }
}
