import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ak_kurim_app/l10n/supported_localizations.dart';
import 'package:ak_kurim_app/core/app_settings/presenation/providers/app_settings_notifier_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final appSettings = ref.watch(appSettingsNotifierProvider);

    return MaterialApp(
      title: 'Athletics Club Manager',
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Center(
          child: appSettings.when(
        data: (appSettings) => Text(appSettings.locale.toString()),
        loading: () => CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      )),
    );
  }
}
