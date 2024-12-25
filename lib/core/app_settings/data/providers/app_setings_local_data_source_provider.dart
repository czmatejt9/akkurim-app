import '../data_sources/local_storage_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_setings_local_data_source_provider.g.dart';

@riverpod
LocalStorageDataSource appSettingslocalStorageDataSource(Ref ref) {
  return LocalStorageDataSource();
}
