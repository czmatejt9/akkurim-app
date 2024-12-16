import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ak_kurim_app/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

part 'sync_service.g.dart';

class SyncState {
  final ConnectivityResult connectivityResult;
  final int toSync;
  final bool isUploading;
  final bool isDownloading;

  SyncState({
    required this.connectivityResult,
    required this.toSync,
    required this.isUploading,
    required this.isDownloading,
  });
}

@riverpod
class SyncService extends _$SyncService {
  @override
  Stream<SyncState> build() async* {
    final connectivityResult = await Connectivity().checkConnectivity();
    final db = await ref.watch(databaseProvider.future);
    final toSyncData = await db
        .rawQuery('SELECT COUNT(*) FROM sync_q'); // TODO change to sync_queue
    final toSync = Sqflite.firstIntValue(toSyncData) ?? 0;

    Connectivity().onConnectivityChanged.listen((result) {
      state = AsyncValue.data(SyncState(
        connectivityResult: result.first,
        toSync: toSync,
        isUploading: false,
        isDownloading: false,
      ));
    });
    yield SyncState(
      connectivityResult: connectivityResult.first,
      toSync: toSync,
      isUploading: false,
      isDownloading: false,
    );
  }

  Future<void> addToSyncQueue(
      String endpoint, String method, String data) async {
    final db = await ref.watch(databaseProvider.future);
    await db.rawInsert(
      'INSERT INTO sync_q (endpoint, method, data, created_at, updated_at) VALUES (?, ?, ?, ?, ?)',
      [
        endpoint,
        method,
        data,
        DateTime.now().toIso8601String(),
        DateTime.now().toIso8601String()
      ],
    );
    state = AsyncValue.data(SyncState(
      connectivityResult: state.value!.connectivityResult,
      toSync: state.value!.toSync + 1,
      isUploading: state.value!.isUploading,
      isDownloading: state.value!.isDownloading,
    ));
  }
}
