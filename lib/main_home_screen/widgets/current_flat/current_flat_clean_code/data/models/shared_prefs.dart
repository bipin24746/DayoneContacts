import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<String?> getAuthTokens() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }
}