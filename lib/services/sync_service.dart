import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ak_kurim_app/services/database_service.dart';

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
    final toSyncData = await db.rawQuery(
        'SELECT COUNT(*) FROM remote_config'); // TODO change to sync_queue
    final toSync = toSyncData.first['COUNT(*)']! as int;

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
}
