import '../models/app_settings.dart';
import 'package:flutter/material.dart';

abstract class AppSettingsRepository {
  Future<AppSettings> getAppSettings();
  Future<void> setThemeMode(ThemeMode themeMode);
  Future<void> setLocale(Locale locale);
}
