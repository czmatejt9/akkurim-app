import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../use_cases/set_theme_mode.dart';
import 'app_settings_repostiory_provider.dart';

part 'set_theme_mode_provider.g.dart';

@riverpod
SetthemeData setthemeData(Ref ref) {
  final repository = ref.read(appSettingsRepositoryProvider);
  return SetthemeData(repository);
}
