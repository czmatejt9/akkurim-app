import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ak_kurim_app/models/remote_config.dart';
import 'package:ak_kurim_app/services/database_service.dart';
import 'package:ak_kurim_app/services/user_settings_service.dart';
import 'package:sqflite/sqflite.dart';

part 'remote_config_service.g.dart';

@riverpod
Future<RemoteConfig> remoteConfig(Ref ref) async {
  {
    final db = await ref.watch(databaseProvider.future);
    final userSettings = await ref.watch(userSettingsServiceProvider.future);
    final mode = userSettings.mode;
    Dio dio = Dio();
    print("Fetching remote config");

    // try reading server url from the local database
    final List<Map<String, dynamic>> maps = await db.query(
      'remote_config',
      columns: [
        'id',
        'server_url',
        'websocket_url',
        'dev_prefix',
        'welcome_message',
        'minimum_app_version',
      ],
      where: 'id = ?',
      limit: 1,
      whereArgs: [0],
    );
    RemoteConfig remoteConfig;
    if (maps.isNotEmpty) {
      remoteConfig = RemoteConfig.fromJson(maps.first);
    } else {
      // return default remote config
      remoteConfig = RemoteConfig(
        id: 0,
        serverUrl: "api.akkurim.cz",
        websocketUrl: "",
        devPrefix: "dev",
        welcomeMessage:
            "Pro prvotní nastavení aplikace je potřeba internetové připojení\n",
        minimumVersion: "0.0.0",
      );
    }

    // fetch the rest of the config from the server
    final serverUrl = mode == ModeEnum.prod
        ? "https://${remoteConfig.serverUrl}"
        : "https://${remoteConfig.devPrefix}${remoteConfig.serverUrl}";
    var res = await dio.get("$serverUrl/v1/remote-config/0").onError(
      (error, stackTrace) {
        // return server error to notidy to load from local database
        return Response(
          requestOptions: RequestOptions(path: ""),
          statusCode: 500,
          statusMessage: "Server error",
        );
      },
    );
    print("Remote config status code: ${res.statusCode}");
    if (res.statusCode == 500) {
      // load from local database
      print("Loading remote config from local database");
      return remoteConfig;
    }
    final Map<String, dynamic> body = res.data;
    final newRemoteConfig = RemoteConfig.fromJson(body);
    print("New remote config: $newRemoteConfig");
    await db.insert(
      'remote_config',
      newRemoteConfig.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Remote config loaded from server");
    return newRemoteConfig;
  }
}
