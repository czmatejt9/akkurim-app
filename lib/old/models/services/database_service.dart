import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database_service.g.dart';

@riverpod
Future<Database> database(Ref ref) async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(),
        'akkurim.db'), // TODO change the name of the database
    onCreate: (db, version) async {
      await db.execute(initSQL);
      await db.execute(syncQueueSQL);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute(initSQL);
      await db.execute('''DROP TABLE IF EXISTS sync_q''');
      await db.execute(syncQueueSQL);
    },
    version: 10,
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

// type refers to upload or download or should I get it from method?
String syncQueueSQL = '''
CREATE TABLE IF NOT EXISTS sync_q(
  id INTEGER PRIMARY KEY,
  endpoint TEXT,
  method TEXT,
  data TEXT,
  type TEXT,
  created_at TEXT,
  updated_at TEXT
);
''';
