import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/todo/presentation/screens/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get directory path for isar
  final dir = await getApplicationDocumentsDirectory();

  // open isar db
  final isar = await Isar.open([TodoModelSchema], directory: dir.path);

  // init repo with isar db
  final isarTodoRepository = TodoRepositoryImpl(isar);

  runApp(MyApp(todoRepository: isarTodoRepository));
}

class MyApp extends StatelessWidget {
  final TodoRepository todoRepository;

  const MyApp({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),

      home: TodoPage(todoRepository: todoRepository),
    );
  }
}
