import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supertokens_flutter/supertokens.dart';

import 'firebase_options.dart';
import 'models/screens/home_screen.dart';
import 'models/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SuperTokens.init(
    apiDomain:
        "https://${kDebugMode ? "dev" : ""}api.akkurim.cz", // TODO load from config
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isLogged = await SuperTokens.doesSessionExist();
  runApp(
    ProviderScope(
      child: EntryPoint(initState: isLogged),
    ),
  );
}

class EntryPoint extends StatelessWidget {
  final bool initState;
  const EntryPoint({super.key, required this.initState});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AK Kuřim',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('cs', 'CZ'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(
        colorScheme:
            ColorScheme.dark(secondary: Colors.green, onPrimary: Colors.green),
        useMaterial3: true,
      ),
      home: initState ? const HomeScreen() : LoginScreen(),
    );
  }
}
