import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String tokenKey = "token";

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<void> clearDeleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }
}
