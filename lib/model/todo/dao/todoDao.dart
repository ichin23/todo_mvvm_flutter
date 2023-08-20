import 'package:sqflite/sqflite.dart';
import 'package:todo_mvvm/model/todo/table/tableTodo.dart';
import 'package:todo_mvvm/model/todo/todo.dart';

import '../table/dbConfig.dart';

class TodoDao {
  Database? _db;
  TodoDao() {
    _getDbInstance();
  }

  _getDbInstance() async => _db = await DbConfig.getInstance();

  Future<List<Todo>> getAllTodo() async {
    List<Map<String, Object?>>? todoMap =
        await _db?.query(TableTodo.tableName, orderBy: "status");

    if (todoMap == null || todoMap.isEmpty) return [];

    return todoMap.map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> addTodo(Todo todo) async {
    await _db?.insert(TableTodo.tableName, todo.toJson());
  }

  editTodo(Todo todo) async {
    await _db?.update(TableTodo.tableName, todo.toJson(),
        where: "id = ?", whereArgs: [todo.id]);
  }

  deleteTodo(Todo todo) async {
    await _db?.delete(TableTodo.tableName,
        where: "${TableTodo.idColumn} = ?", whereArgs: [todo.id]);
  }

  Future close() async => _db?.close();
}
