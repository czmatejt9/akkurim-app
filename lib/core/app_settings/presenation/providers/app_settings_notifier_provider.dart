import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/providers/get_app_settings_provider.dart';
import '../../domain/models/app_settings.dart';

part 'app_settings_notifier_provider.g.dart';

@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  Future<AppSettings> build() async {
    final getAppSettings = ref.read(getAppSettingsProvider);
    return await getAppSettings();
  }
}
