import 'package:ak_kurim_app/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../l10n/supported_localizations.dart';
import '../entities/app_settings_entity.dart';
import 'app_settings_repository.dart';
import '../../data/data_sources/local_storage_data_source.dart';
import '../../data/mappers/app_settings_mapper.dart';
import '../../data/models/app_settings_data.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final LocalStorageDataSource dataSource;

  AppSettingsRepositoryImpl(this.dataSource);

  @override
  Future<AppSettingsEntity> getAppSettings() async {
    AppSettingsData data = await dataSource.getAppSettingsData();
    if (data.locale == null || data.isDarkMode == null) {
      if (data.isDarkMode == null) {
        await setthemeData(ThemeMode.system == ThemeMode.dark);
      }
      if (data.locale == null) {
        Locale loc = Locale(Intl.getCurrentLocale().split('_').first);
        if (!SupportedLocalizations.supportedLocales.contains(loc)) {
          loc = Locale(DefaultConfig.defaultLocaleString);
        }
      }
      data = await dataSource.getAppSettingsData();
    }

    return AppSettingsMapper.dataToEntity(data);
  }

  @override
  Future<void> setthemeData(bool isDarkMode) async {
    return dataSource.saveThemeData(isDarkMode);
  }

  @override
  Future<void> setLocale(Locale locale) async {
    return dataSource.saveLocale(AppSettingsMapper.localeToString(locale));
  }
}
