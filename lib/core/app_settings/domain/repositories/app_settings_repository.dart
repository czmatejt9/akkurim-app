import '../models/app_settings.dart';
import 'package:flutter/material.dart';

abstract class AppSettingsRepository {
  Future<AppSettings> getAppSettings();
  Future<void> saveThemeMode(ThemeMode themeMode);
  Future<void> saveLocale(Locale locale);
}
