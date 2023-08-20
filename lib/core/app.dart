import 'package:flutter/material.dart';
import 'package:todo_mvvm/core/ui/todoHomeScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const TodoHome(),
    );
  }
}
