import '../repositories/app_settings_repository.dart';
import 'package:flutter/material.dart';

class SetThemeMode {
  final AppSettingsRepository repository;

  SetThemeMode(this.repository);

  Future<void> call(ThemeMode themeMode) {
    return repository.saveThemeMode(themeMode);
  }
}
