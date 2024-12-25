import '../repositories/app_settings_repository.dart';

class SetthemeData {
  final AppSettingsRepository repository;

  SetthemeData(this.repository);

  Future<void> call(bool isDarkMode) {
    return repository.setthemeData(isDarkMode);
  }
}
