import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> saveLanguageCode(String languageCode) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("language_code", languageCode);
  }

  Future<String> getLanguageCode() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("language_code") ?? 'en';
  }
}
