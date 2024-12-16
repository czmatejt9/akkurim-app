import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/services/auth_service.dart';
import 'package:ak_kurim_app/screens/login_screen.dart';
import 'package:ak_kurim_app/services/remote_config_service.dart';
import 'package:ak_kurim_app/models/remote_config.dart';
import 'package:ak_kurim_app/widgets/appbar_main.dart';
import 'package:ak_kurim_app/services/sync_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authServiceProvider, (previous, next) {
      if (next.state == AuthStateEnum.initial) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else if (next.state == AuthStateEnum.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went very wrong (Logout failed)'),
          ),
        );
      }
    });
    final AsyncValue<RemoteConfig> remoteConfig =
        ref.watch(remoteConfigProvider);

    return Scaffold(
      appBar: AppbarMain(),
      body: Column(
        children: [
          switch (remoteConfig) {
            AsyncData(:final value) => Text(value.welcomeMessage),
            AsyncError(:final error, :final stackTrace) =>
              Text(error.toString() + stackTrace.toString()),
            _ => const CircularProgressIndicator(),
          },
          Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(authServiceProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(syncServiceProvider.notifier).addToSyncQueue(
                '/fake-sync-endpoint',
                'POST',
                '{"data": "fake data"}',
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
