// CRUD operations for todo items
import 'package:todo_app/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  // get
  Future<List<Todo>> getTodoItems();

  // add
  Future<void> addTodoItem(Todo todo);

  // update
  Future<void> updateTodoItem(Todo todo);

  // delete
  Future<void> deleteTodoItem(int id);
}
