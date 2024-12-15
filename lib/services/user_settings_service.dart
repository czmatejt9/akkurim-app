import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_service.g.dart';

enum ModeEnum { prod, dev }

class UserSettings {
  final bool darkMode;
  final ModeEnum mode;
  UserSettings({required this.darkMode, this.mode = ModeEnum.prod});
}

@riverpod
class UserSettingsService extends _$UserSettingsService {
  Future<UserSettings> _fetchUserSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final darkMode = prefs.getBool('darkMode') ?? false;
    final mode =
        prefs.getString('mode') ?? 'dev'; // TODO change to prod in production
    final modeEnum = mode == 'prod' ? ModeEnum.prod : ModeEnum.dev;
    return UserSettings(darkMode: darkMode, mode: modeEnum);
  }

  @override
  Future<UserSettings> build() async {
    return _fetchUserSettings();
  }

  Future<void> setDarkMode(bool darkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', darkMode);
    state = await AsyncValue.guard(() => _fetchUserSettings());
  }
}
