import 'package:get_it/get_it.dart';
import 'package:todo_mvvm/model/ui/todoHomeViewModel.dart';
import 'package:todo_mvvm/model/todo/dao/todoDao.dart';

injectDependencies() {
  GetIt.I.registerSingleton(TodoDao());
  GetIt.I.registerLazySingleton(() => TodoViewModel(GetIt.I.get<TodoDao>()));
}
