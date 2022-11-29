import 'package:shared_preferences/shared_preferences.dart';
import 'package:dagizo_app/core/di/injector.dart';

class Prefs {
  /* prefs keys */

  Future<SharedPreferences> getInstance() async {
    await inject.allReady();
    return inject.get<SharedPreferences>();
  }

  Future saveString(String key, String value) async {
    return await (await getInstance()).setString(key, value);
  }

  Future getString(String key) async {
    var instance = await getInstance();
    return instance.getString(key);
  }

  Future clearStorage() async {
    await (await getInstance()).clear();
  }
}
