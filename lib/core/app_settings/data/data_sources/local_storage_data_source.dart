import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ak_kurim_app/l10n/supported_localizations.dart';

class LocalStorageDataSource {
  static const _themeModeKey = 'themeMode';
  static const _localeKey = 'locale';

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    bool? themeModeIndex = prefs.getBool(_themeModeKey);
    if (themeModeIndex == null) {
      return ThemeMode.system;
    }
    return themeModeIndex ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeModeKey, themeMode == ThemeMode.dark);
  }

  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeKey);
    // get system locale if no locale is saved
    if (languageCode == null) {
      final locale = Locale(Intl.getCurrentLocale().split('_').first);
      print('System locale: $locale'); // debug
      if (SupportedLocalizations.supportedLocales.contains(locale)) {
        return locale;
      }
    }
    return Locale(languageCode ?? 'cs');
  }

  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}
