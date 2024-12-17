import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ak_kurim_app/services/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ak_kurim_app/services/remote_config_service.dart';
import 'package:dio/dio.dart';
import 'package:supertokens_flutter/dio.dart';
import 'package:ak_kurim_app/services/user_settings_service.dart';

part 'sync_service.g.dart';
part 'sync_service.freezed.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState({
    required ConnectivityResult connectivityResult,
    required int toSync,
    required bool isUploading,
    required bool isDownloading,
    required DateTime lastSyncedAt,
  }) = _SyncState;
}

@riverpod
class SyncService extends _$SyncService {
  @override
  Stream<SyncState> build() async* {
    final connectivityResult = await Connectivity().checkConnectivity();
    final db = await ref.watch(databaseProvider.future);
    final toSyncData = await db.rawQuery('SELECT COUNT(*) FROM sync_q');
    final toSync = Sqflite.firstIntValue(toSyncData) ?? 0;

    Connectivity().onConnectivityChanged.listen((result) async {
      state = AsyncValue.data(state.value!.copyWith(
        connectivityResult: result.last,
      ));
      _syncData();
    });

    yield SyncState(
      connectivityResult: connectivityResult.first,
      toSync: toSync,
      isUploading: false,
      isDownloading: false,
      lastSyncedAt:
          DateTime.now(), // TODO make sure to actually sync at app start
    );
  }

  Future<void> _syncData() async {
    print("Syncing data");
    if (state.value!.toSync == 0 ||
        state.value!.isUploading ||
        state.value!.isDownloading ||
        state.value!.connectivityResult == ConnectivityResult.none) {
      print("Canceling sync");
      return;
    }
    final userSettings = await ref.watch(userSettingsServiceProvider.future);
    if (userSettings.useMobileData == false &&
        state.value!.connectivityResult == ConnectivityResult.mobile) {
      return;
    }

    state = AsyncValue.data(state.value!.copyWith(
      isUploading: true,
    ));

    final db = await ref.watch(databaseProvider.future);
    final remoteConfig = await ref.watch(remoteConfigProvider.future);
    final uploadData =
        await db.rawQuery('SELECT * FROM sync_q where type = ?', ['upload']);
    final Dio dio = Dio();
    dio.interceptors.add(SuperTokensInterceptorWrapper(client: dio));
    final serverUrl = userSettings.mode == ModeEnum.prod
        ? "https://${remoteConfig.serverUrl}"
        : "https://${remoteConfig.devPrefix}${remoteConfig.serverUrl}";
    // TODO implement the getter for the server url or change the way the user can change the mode

    final futures = uploadData.map((data) async {
      try {
        final res = await dio.request(
          "$serverUrl${data['endpoint']}",
          data: data['data'],
          options: Options(method: data['method'] as String),
        );
        // if an error occurs we just don't delete the item from the sync queue
        // and thus it will be retried on the next sync attempt TODO maybe change this so that we don't retry forever
        if (res.statusCode == 200 ||
            res.statusCode == 201 ||
            res.statusCode == 204) {
          await db.rawDelete('DELETE FROM sync_q WHERE id = ?', [data['id']]);
          state = AsyncValue.data(state.value!.copyWith(
            toSync: state.value!.toSync - 1,
          ));
        }
      } catch (error) {
        print("Error: $error");
        // TODO maybe add a retry mechanism and actually handle the error
      }
    }).toList();
    await Future.wait(futures);

    state = AsyncValue.data(state.value!.copyWith(
      // TODO uncomment when relevant isDownloading: true,
      isUploading: false,
      lastSyncedAt: DateTime.now(),
    ));

    // TODO implement the download part here or somewhere else

    // we call this again to check if there are more items to sync which were added while we were syncing
    _syncData();
  }

  Future<void> addToSyncQueue(
      String endpoint, String method, String data, String type) async {
    final db = await ref.watch(databaseProvider.future);
    await db.rawInsert(
      'INSERT INTO sync_q (endpoint, method, data, type, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)',
      [
        endpoint,
        method,
        data,
        type,
        DateTime.now().toIso8601String(),
        DateTime.now().toIso8601String()
      ],
    );
    state =
        AsyncValue.data(state.value!.copyWith(toSync: state.value!.toSync + 1));
    _syncData();
  }
}
