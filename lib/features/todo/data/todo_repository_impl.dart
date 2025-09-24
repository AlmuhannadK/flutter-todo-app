import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/todo_model.dart';
import 'package:todo_app/features/todo/domain/todo.dart';
import 'package:todo_app/features/todo/domain/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  // database local storage
  final Isar db;

  TodoRepositoryImpl(this.db);

  // implementation of CRUD defined in domain
  // get
  @override
  Future<List<Todo>> getTodoItems() async {
    final todos = await db.todoModels.where().findAll();

    return todos.map((todoItem) => todoItem.toDomain()).toList();
  }

  // add
  @override
  Future<void> addTodoItem(Todo todo) async {
    final addedTodo = TodoModel.fromDomain(todo);

    return db.writeTxn(() => db.todoModels.put(addedTodo));
  }

  // update
  @override
  Future<void> updateTodoItem(Todo todo) {
    // note: put operator will insert and update
    final updatedTodo = TodoModel.fromDomain(todo);

    return db.writeTxn(() => db.todoModels.put(updatedTodo));
  }

  // delete
  @override
  Future<void> deleteTodoItem(int id) async {
    await db.writeTxn(() => db.todoModels.delete(id));
  }
}
