import '../../domain/models/app_settings.dart';
import '../../domain/repositories/app_settings_repository.dart';
import '../data_sources/local_storage_data_source.dart';
import 'package:flutter/material.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final LocalStorageDataSource dataSource;

  AppSettingsRepositoryImpl(this.dataSource);

  @override
  Future<AppSettings> getAppSettings() async {
    final themeMode = await dataSource.getThemeMode();
    final locale = await dataSource.getLocale();
    return AppSettings(themeMode: themeMode, locale: locale);
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    return dataSource.saveThemeMode(themeMode);
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    return dataSource.saveLocale(locale);
  }
}
