import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'databse_service.g.dart';

@riverpod
Future<Database> database(Ref ref) async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(),
        'akkurim.db'), // TODO change the name of the database
    onCreate: (db, version) {
      return db.execute(initSQL);
    },
    version: 2,
  );

  return database;
}

// TODO change the schema of sync_queue
String initSQL = '''
CREATE table IF NOT EXISTS remote_config(
  id INTEGER PRIMARY KEY,
  server_url TEXT,
  websocket_url TEXT,
  dev_prefix TEXT,
  welcome_message TEXT,
  minimum_app_version TEXT
);

CREATE table IF NOT EXISTS sync_queue(
  id INTEGER PRIMARY KEY,
  data TEXT
);
''';
// TODO update this schema
