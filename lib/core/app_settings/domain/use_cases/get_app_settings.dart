import '../entities/app_settings_entity.dart';
import '../repositories/app_settings_repository.dart';

class GetAppSettings {
  final AppSettingsRepository repository;

  GetAppSettings(this.repository);

  Future<AppSettingsEntity> call() async {
    return await repository.getAppSettings();
  }
}
