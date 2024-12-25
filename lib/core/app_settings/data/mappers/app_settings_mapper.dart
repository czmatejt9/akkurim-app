import 'package:flutter/material.dart';

import '../../domain/entities/app_settings_entity.dart';
import '../models/app_settings_data.dart';

class AppSettingsMapper {
  static Locale stringToLocale(String locale) {
    return Locale(locale);
  }

  static String localeToString(Locale locale) {
    return locale.languageCode;
  }

  static ThemeMode boolToThemeMode(bool isDarkMode) {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static bool themeModeToBool(ThemeMode themeMode) {
    return themeMode == ThemeMode.dark;
  }

  static AppSettingsEntity dataToEntity(AppSettingsData data) {
    return AppSettingsEntity(
      locale: stringToLocale(data.locale!),
      themeMode: boolToThemeMode(data.isDarkMode!),
    );
  }

  static AppSettingsData entityToData(AppSettingsEntity entity) {
    return AppSettingsData(
      locale: localeToString(entity.locale),
      isDarkMode: themeModeToBool(entity.themeMode),
    );
  }
}
