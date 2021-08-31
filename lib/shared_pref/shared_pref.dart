import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolean(
      {required String key,  bool value = false}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static getBoolean({required key}) {
    return sharedPreferences!.getBool(key);
  }
}
