import 'package:todo_mvvm/model/todo/table/tableTodo.dart';

class Todo {
  String name;
  int? id;
  bool status;

  Todo(this.name, this.status, [this.id]);

  Todo.fromJson(Map data)
      : name = data[TableTodo.nameColumn],
        id = data[TableTodo.idColumn],
        status = data[TableTodo.statusColumn] == 0 ? false : true;

  toJson() => {
        TableTodo.nameColumn: name,
        TableTodo.idColumn: id,
        TableTodo.statusColumn: status ? 1 : 0
      };

  copy({String? name, int? id, bool? status}) =>
      Todo(name ?? this.name, status ?? this.status, id ?? this.id);
}
