import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_settings_data.dart';

class LocalStorageDataSource {
  static const _themeModeKey = 'is_dark_mode';
  static const _localeKey = 'locale';

  Future<AppSettingsData> getAppSettingsData() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool(_themeModeKey);
    String? locale = prefs.getString(_localeKey);
    return AppSettingsData(isDarkMode: isDarkMode, locale: locale);
  }

  Future<void> saveThemeMode(bool themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeModeKey, themeMode);
  }

  Future<void> saveLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale);
  }
}
