import 'package:sqflite/sqflite.dart';

import 'tableTodo.dart';

class DbConfig {
  static Database? _db;

  static Future<Database> getInstance() async {
    _db ??= await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(TableTodo.create());
    });

    return _db!;
  }

  static close() async {
    await _db?.close();
  }
}
