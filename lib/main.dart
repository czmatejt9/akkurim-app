import 'package:ak_kurim_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widgets/theme_mode_row.dart';
import 'l10n/supported_localizations.dart';
import 'providers/app_settings_provider.dart';

void main() async {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);

    return MaterialApp(
      title: Config.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: SupportedLocalizations.supportedLocales,
      locale: appSettings.maybeWhen(
          data: (appSettings) => appSettings.locale, orElse: () => null),
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: appSettings.maybeWhen(
          data: (appSettings) {
            return appSettings.themeData;
          },
          orElse: () => ThemeData.dark()),
      home: appSettings.maybeWhen(
          orElse: () => CircularProgressIndicator(),
          data: (appSettings) => HomeScreen()),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Center(
          child: switch (appSettings) {
        AsyncData(:final value) => ThemeModeRow(),
        AsyncError(:final error, :final stackTrace) =>
          Text('Error: $error $stackTrace'),
        _ => CircularProgressIndicator(),
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appSettingsPProvider.notifier).updateLocale(
                appSettings.maybeWhen(
                    data: (appSettings) => appSettings.locale == Locale('en')
                        ? Locale('cs').languageCode
                        : Locale('en').languageCode,
                    orElse: () => Locale('cs').languageCode),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
