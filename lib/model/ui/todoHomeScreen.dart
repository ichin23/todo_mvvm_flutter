import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mvvm/model/ui/todoHomeViewModel.dart';
import 'package:todo_mvvm/model/todo/todo.dart';
import 'package:todo_mvvm/model/ui/widgets/getText.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  late TodoViewModel todoVM;

  @override
  void initState() {
    super.initState();
    todoVM = GetIt.instance<TodoViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To-Do MVVM")),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: todoVM.status,
            builder: (context, status, _) {
              final todos = todoVM.todos;

              if (status == Status.Loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                  itemBuilder: (context, i) => Dismissible(
                        key: Key(todos[i].id.toString()),
                        background: Row(children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.red,
                            child: const Icon(Icons.delete),
                          )),
                        ]),
                        onDismissed: (direction) => todoVM.deleteTodo(todos[i]),
                        child: ListTile(
                          onTap: () =>
                              getText(context, "Editar ToDo", todos[i].name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  todos[i].status
                                      ? Icons.cancel_outlined
                                      : Icons.check,
                                  color: todos[i].status
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.white,
                                ),
                                onPressed: () => todoVM.editTodo(
                                    todos[i].copy(status: !todos[i].status)),
                              ),
                            ],
                          ),
                          title: Text(todos[i].name,
                              style: TextStyle(
                                color: todos[i].status
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.white,
                              )),
                        ),
                      ),
                  separatorBuilder: (context, i) => const Divider(),
                  itemCount: todos.length);
            }),
      ),
      floatingActionButton: ValueListenableBuilder(
          valueListenable: todoVM.status,
          builder: (context, status, _) {
            if (status == Status.Updating) {
              return FloatingActionButton(
                onPressed: () {},
                child: const CircularProgressIndicator(),
              );
            }

            return FloatingActionButton(
                onPressed: () async {
                  var value = getText(context, "Inserir novo");
                  print(value);
                },
                child: const Icon(Icons.add));
          }),
    );
  }
}
