import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/app_settings_entity.dart';
import '../../domain/providers/get_app_settings_provider.dart';
import '../../domain/providers/set_locale_provider.dart';
import '../../domain/providers/set_theme_mode_provider.dart';

part 'app_settings_provider.g.dart';

@riverpod
class AppSettings extends _$AppSettings {
  Future<void> refresh() async {
    final getAppSettings = ref.read(getAppSettingsProvider);
    state = AsyncValue.data(await getAppSettings());
  }

  @override
  Future<AppSettingsEntity> build() async {
    final getAppSettings = ref.read(getAppSettingsProvider);
    return await getAppSettings();
  }

  Future<void> setLocale(Locale locale) async {
    final setLocale = ref.read(setLocaleProvider);
    await setLocale(locale);
    await refresh();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final setThemeMode = ref.read(setThemeModeProvider);
    await setThemeMode(themeMode);
    await refresh();
  }
}
