import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_settings_repostiory_provider.dart';
import '../use_cases/get_app_settings.dart';

part 'get_app_settings_provider.g.dart';

@riverpod
GetAppSettings getAppSettings(Ref ref) {
  final repository = ref.read(appSettingsRepositoryProvider);
  return GetAppSettings(repository);
}
