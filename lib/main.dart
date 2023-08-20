import 'package:flutter/material.dart';
import 'package:todo_mvvm/core/app.dart';
import 'package:todo_mvvm/model/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  runApp(const App());
}
