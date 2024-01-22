import 'package:flutter/material.dart';
import 'package:todo_mvvm/model/ui/todoHomeScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TodoHome(),
    );
  }
}
