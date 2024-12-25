import 'package:flutter/material.dart';

import '../../domain/entities/app_settings_entity.dart';
import '../models/app_settings_data.dart';
import '../../../../config.dart';

class AppSettingsMapper {
  static Locale stringToLocale(String locale) {
    return Locale(locale);
  }

  static String localeToString(Locale locale) {
    return locale.languageCode;
  }

  static ThemeData boolToThemeData(bool isDarkMode) {
    return isDarkMode ? DefaultConfig.darkTheme : DefaultConfig.lightTheme;
  }

  static bool themeDataToBool(ThemeData themeData) {
    return themeData == DefaultConfig.darkTheme;
  }

  static AppSettingsEntity dataToEntity(AppSettingsData data) {
    return AppSettingsEntity(
      locale: stringToLocale(data.locale!),
      themeData: boolToThemeData(data.isDarkMode!),
    );
  }

  static AppSettingsData entityToData(AppSettingsEntity entity) {
    return AppSettingsData(
      locale: localeToString(entity.locale),
      isDarkMode: themeDataToBool(entity.themeData),
    );
  }
}
