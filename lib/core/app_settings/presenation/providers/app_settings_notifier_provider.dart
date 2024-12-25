import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/providers/get_app_settings_provider.dart';
import '../../domain/providers/set_locale_provider.dart';
import '../../domain/models/app_settings.dart';
import 'package:flutter/material.dart';

part 'app_settings_notifier_provider.g.dart';

@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  Future<void> refresh() async {
    final getAppSettings = ref.read(getAppSettingsProvider);
    state = AsyncValue.data(await getAppSettings());
  }

  @override
  Future<AppSettings> build() async {
    final getAppSettings = ref.read(getAppSettingsProvider);
    return await getAppSettings();
  }

  Future<void> setLocale(Locale locale) async {
    final setLocale = ref.read(setLocaleProvider);
    print('Setting locale to $locale');
    await setLocale(locale);
    await refresh();
  }
}
