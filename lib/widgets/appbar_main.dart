import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/services/sync_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppbarMain extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const AppbarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncServiceProvider);
    return AppBar(
      title: const Text('AK Kurim'),
      actions: [
        IconButton(
          icon: switch (syncState) {
            AsyncData(:final value) => Builder(builder: (context) {
                final syncState = value;
                final color =
                    syncState.connectivityResult == ConnectivityResult.none
                        ? Colors.red
                        : Colors.green;
                return Row(
                  children: [
                    if (syncState.isDownloading) ...[
                      Icon(Icons.download, color: color),
                      const SizedBox(width: 8),
                    ],
                    if (syncState.isUploading) ...[
                      Icon(Icons.upload, color: color),
                      const SizedBox(width: 8),
                    ],
                    if (syncState.connectivityResult == ConnectivityResult.none)
                      const Icon(Icons.signal_wifi_off, color: Colors.red),
                    if (syncState.connectivityResult == ConnectivityResult.wifi)
                      const Icon(Icons.wifi, color: Colors.green),
                    if (syncState.connectivityResult ==
                        ConnectivityResult.mobile)
                      const Icon(Icons.mobile_friendly, color: Colors.green),
                    Text(syncState.toSync.toString()),
                  ],
                );
              }),
            AsyncError(:final error, :final stackTrace) =>
              Builder(builder: (context) {
                return Text(error.toString() + stackTrace.toString());
              }),
            _ => Icon(Icons.sync_disabled),
          },
          onPressed: () {
            // TODO: implement sync
          },
        ),
      ],
    );
  }
}
