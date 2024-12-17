import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/widgets/sync_icon.dart';

class AppbarMain extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const AppbarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('AK Kurim'),
      actions: [
        const SyncIcon(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
            )), // TODO: Implement settings page
      ],
    );
  }
}
