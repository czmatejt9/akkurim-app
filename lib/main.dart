import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:supertokens_flutter/supertokens.dart';
import 'package:ak_kurim_app/services/auth_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ak_kurim_app/screens/home_screen.dart';
import 'package:ak_kurim_app/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SuperTokens.init(
    apiDomain: "https://devapi.akkurim.cz", // TODO load from config
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isLogged = await SuperTokens.doesSessionExist();
  print(isLogged);
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
      theme: ThemeData(
        colorScheme:
            ColorScheme.dark(secondary: Colors.green, onPrimary: Colors.green),
        useMaterial3: true,
      ),
      home: initState ? const HomeScreen() : LoginScreen(),
    );
  }
}
