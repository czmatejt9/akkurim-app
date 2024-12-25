import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../use_cases/set_locale.dart';
import 'app_settings_repostiory_provider.dart';

part 'set_locale_provider.g.dart';

@riverpod
SetLocale setLocale(Ref ref) {
  final repository = ref.read(appSettingsRepositoryProvider);
  return SetLocale(repository);
}
