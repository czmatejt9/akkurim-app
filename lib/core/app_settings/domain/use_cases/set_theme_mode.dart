import 'package:flutter/material.dart';

import '../repositories/app_settings_repository.dart';

class SetThemeMode {
  final AppSettingsRepository repository;

  SetThemeMode(this.repository);

  Future<void> call(ThemeMode themeMode) {
    return repository.setThemeMode(themeMode);
  }
}
