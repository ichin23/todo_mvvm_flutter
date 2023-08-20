import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mvvm/core/ui/todoHomeViewModel.dart';
import 'package:todo_mvvm/model/todo/todo.dart';

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
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: todoVM.status,
            builder: (context, status, _) {
              final todos = todoVM.todos;

              if (status == Status.Loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                  itemBuilder: (context, i) => ListTile(
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => todoVM.deleteTodo(todos[i]),
                        ),
                        title: Text(todos[i].name),
                      ),
                  separatorBuilder: (context, i) => const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Divider(),
                      ),
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
                onPressed: () {
                  showAddTodo(context);
                },
                child: const Icon(Icons.add));
          }),
    );
  }
}

showAddTodo(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) => StatefulBuilder(builder: (context, setstate) {
                TextEditingController title = TextEditingController();
                return Column(
                  children: [
                    TextFormField(
                      controller: title,
                    ),
                    TextButton(
                      child: const Text("Add"),
                      onPressed: () {
                        GetIt.I<TodoViewModel>()
                            .addTodo(Todo(title.text, false));
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              })));
}
