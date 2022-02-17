import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = "my_database.db";
  static const int _databaseVersion = 1;

  static String tableUser = "user";

  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(join(dbPath, _databaseName),
        onCreate: _createDB, version: _databaseVersion);
  }

  static FutureOr<void> _createDB(Database db, int version) {
    db.execute(
      "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT)",
    );
  }
}
