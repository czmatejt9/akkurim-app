import '../models/app_settings.dart';
import '../repositories/app_settings_repository.dart';

class GetAppSettings {
  final AppSettingsRepository repository;

  GetAppSettings(this.repository);

  Future<AppSettings> call() {
    return repository.getAppSettings();
  }
}
