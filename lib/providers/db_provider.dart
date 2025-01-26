import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/database/drift_database.dart';

part 'db_provider.g.dart';

@riverpod
AppDatabase db(Ref ref) {
  return database;
}
