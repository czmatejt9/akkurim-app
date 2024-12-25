import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_setings_local_data_source_provider.dart';
import '../../domain/repositories/app_settings_repository.dart';
import '../../data/repositories/app_settings_repository_impl.dart';

part 'app_settings_repostiory_provider.g.dart';

@riverpod
AppSettingsRepository appSettingsRepository(Ref ref) {
  final dataSource = ref.watch(appSettingslocalStorageDataSourceProvider);
  return AppSettingsRepositoryImpl(dataSource);
}
