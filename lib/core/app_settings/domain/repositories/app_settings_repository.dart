import 'package:flutter/material.dart';

import '../entities/app_settings_entity.dart';

abstract class AppSettingsRepository {
  Future<AppSettingsEntity> getAppSettings();
  Future<void> setThemeMode(ThemeMode themeMode);
  Future<void> setLocale(Locale locale);
}
