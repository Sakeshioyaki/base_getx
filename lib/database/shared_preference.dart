import 'package:base_getx/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String tokenKey = 'token';
  static const String firstLoginKey = 'first_login';
  static const String languageCodeKey = 'languageCode';

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(tokenKey);
      return token;
    } catch (e) {
      logger.e('get token err -> $e');
      return null;
    }
  }

  static Future<void> setFirstLogin(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(firstLoginKey, isLogin);
  }

  static Future<bool?> getFirstLogin() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLogin = prefs.getBool(firstLoginKey);
      return isLogin;
    } catch (e) {
      logger.e('getFirstLogin()$e');
      return null;
    }
  }

  static Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(languageCodeKey, languageCode);
  }

  static Future<String?> getLanguage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? languageCode = prefs.getString(languageCodeKey);
      return languageCode;
    } catch (e) {
      logger.e('getLanguage()$e');
      return null;
    }
  }
}
