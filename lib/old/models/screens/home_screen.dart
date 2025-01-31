import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../remote_config.dart';
import '../services/auth_service.dart';
import '../services/remote_config_service.dart';
import '../services/sync_service.dart';
import '../widgets/appbar_main.dart';
import 'login_screen.dart';

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
                'upload',
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
