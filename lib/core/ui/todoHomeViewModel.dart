import 'package:flutter/foundation.dart';
import 'package:todo_mvvm/model/todo/dao/todoDao.dart';
import 'package:todo_mvvm/model/todo/todo.dart';

enum Status { Loading, Completed, Error, Updating }

class TodoViewModel {
  List<Todo> todos = [];
  TodoDao dao;
  ValueNotifier<Status> status = ValueNotifier(Status.Loading);

  TodoViewModel(this.dao) {
    loadTodos();
  }

  loadTodos() async {
    status.value = Status.Loading;
    todos = await dao.getAllTodo();
    status.value = Status.Completed;
  }

  addTodo(Todo todo) async {
    status.value = Status.Updating;
    await dao.addTodo(todo);
    todos = await dao.getAllTodo();
    status.value = Status.Completed;
  }

  deleteTodo(Todo todo) async {
    status.value = Status.Updating;
    await dao.deleteTodo(todo);
    todos = await dao.getAllTodo();
    status.value = Status.Completed;
  }
}
