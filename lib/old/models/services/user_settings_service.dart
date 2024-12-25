import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_settings_service.g.dart';

enum ModeEnum {
  prod,
  dev,
}

class UserSettingsState {
  final bool darkMode;
  final ModeEnum mode;
  final bool useMobileData;
  UserSettingsState({
    required this.darkMode,
    this.mode = ModeEnum.prod,
    this.useMobileData = false,
  });
}

@riverpod
class UserSettingsService extends _$UserSettingsService {
  Future<UserSettingsState> _fetchUserSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final darkMode = prefs.getBool('darkMode') ?? true;
    final useMobileData = prefs.getBool('useMobileData') ?? false;
    final mode =
        prefs.getString('mode') ?? 'dev'; // TODO change to prod in production
    final modeEnum = mode == 'prod' ? ModeEnum.prod : ModeEnum.dev;
    return UserSettingsState(
      darkMode: darkMode,
      mode: modeEnum,
      useMobileData: useMobileData,
    );
  }

  @override
  Future<UserSettingsState> build() async {
    return _fetchUserSettings();
  }

  Future<void> writeUserSettings({
    bool? darkMode,
    bool? useMobileData,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    // write to shared preferences values that are not null
    if (darkMode != null) {
      await prefs.setBool('darkMode', darkMode);
    }
    if (useMobileData != null) {
      await prefs.setBool('useMobileData', useMobileData);
    }
    state = await AsyncValue.guard(() => _fetchUserSettings());
  }
}
