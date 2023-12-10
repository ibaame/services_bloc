import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> saveTheme(String themeName) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("theme", themeName);
  }

  Future<String> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("theme") ?? "light";
  }
}
