import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _prefs;

  // Initialization
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  //------------------------------------------------

  // Theme Preferences
  static Future setThemeMode(String mode) async {
    await _prefs?.setString('themeMode', mode);
  }

  static String? getThemeMode() {
    return _prefs?.getString('themeMode');
  }
  //-----------------------------------------------
}
