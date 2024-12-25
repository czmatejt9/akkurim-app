import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/app_settings_provider.dart';
import '../../../../config.dart';

class themeDataSwitch extends ConsumerWidget {
  const themeDataSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    // use the slider to switch between light and dark mode
    return Switch(
      value: appSettings.maybeWhen(
          data: (appSettings) =>
              appSettings.themeData == DefaultConfig.darkTheme,
          orElse: () => true),
      onChanged: (value) {
        ref.read(appSettingsProvider.notifier).setthemeData(value);
      },
    );
  }
}
