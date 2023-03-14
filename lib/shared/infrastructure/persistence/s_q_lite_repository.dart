import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteRepository {
  Database? database;
  connect(name) async {
    //'doggie_database.db'
    WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(join(await getDatabasesPath(), name),
        onCreate: (db, version) {
      // migrations?
      return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    });
  }
}
