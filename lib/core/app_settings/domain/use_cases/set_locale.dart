import '../repositories/app_settings_repository.dart';
import 'package:flutter/material.dart';

class SetLocale {
  final AppSettingsRepository repository;

  SetLocale(this.repository);

  Future<void> call(Locale locale) {
    return repository.setLocale(locale);
  }
}
