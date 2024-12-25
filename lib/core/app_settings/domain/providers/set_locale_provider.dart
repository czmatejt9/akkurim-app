import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_settings_repostiory_provider.dart';
import '../use_cases/set_locale.dart';

part 'set_locale_provider.g.dart';

@riverpod
SetLocale setLocale(Ref ref) {
  final repository = ref.read(appSettingsRepositoryProvider);
  return SetLocale(repository);
}
