import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_settings_data.dart';

class LocalStorageDataSource {
  static const _themeDataKey = 'is_dark_mode';
  static const _localeKey = 'locale';

  Future<AppSettingsData> getAppSettingsData() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool(_themeDataKey);
    String? locale = prefs.getString(_localeKey);
    return AppSettingsData(isDarkMode: isDarkMode, locale: locale);
  }

  Future<void> saveThemeData(bool themeData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeDataKey, themeData);
  }

  Future<void> saveLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale);
  }
}
