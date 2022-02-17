import 'package:base_project_getx/data/local/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class Sqlite {
  Sqlite() {
    initSqlite();
  }

  late Database _db;

  void initSqlite() async {
    _db = await DatabaseHelper.initDatabase();
  }
}
