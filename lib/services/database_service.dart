import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_service.g.dart';

@riverpod
Future<Database> database(Ref ref) async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(),
        'akkurim.db'), // TODO change the name of the database
    onCreate: (db, version) async {
      await db.execute(initSQL);
      print('Created database');
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute(initSQL);
      await db.execute(syncQueueSQL);
      print('Upgraded database from $oldVersion to $newVersion');
    },
    version: 9,
  );

  database.then((db) async {
    List<Map<String, dynamic>> tables =
        await db.rawQuery('SELECT name FROM sqlite_master WHERE type="table"');
    print(
        'Tables in database: ${tables.map((table) => table['name']).toList()}');
  });
  return database;
}

String initSQL = '''
CREATE table IF NOT EXISTS remote_config(
  id INTEGER PRIMARY KEY,
  server_url TEXT,
  websocket_url TEXT,
  dev_prefix TEXT,
  welcome_message TEXT,
  minimum_app_version TEXT
);
''';

String syncQueueSQL = '''
CREATE TABLE IF NOT EXISTS sync_q(
  id INTEGER PRIMARY KEY,
  endpoint TEXT,
  method TEXT,
  data TEXT,
  created_at TEXT,
  updated_at TEXT
);
''';
