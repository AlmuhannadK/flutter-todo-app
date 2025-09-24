import 'package:isar/isar.dart';
import 'package:todo_app/data/todo_model.dart';
import 'package:todo_app/domain/todo.dart';
import 'package:todo_app/domain/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  // database local storage
  final Isar db;

  TodoRepositoryImpl(this.db);

  // implementation of CRUD defined in domain
  // get
  @override
  Future<List<Todo>> getTodoItems() async {
    final todos = await db.todoEntitys.where().findAll();

    return todos.map((todoItem) => todoItem.toDomain()).toList();
  }

  // add
  @override
  Future<void> addTodoItem(Todo todo) async {
    final addedTodo = TodoEntity.fromDomain(todo);

    return db.writeTxn(() => db.todoEntitys.put(addedTodo));
  }

  // update
  @override
  Future<void> updateTodoItem(Todo todo) {
    // note: put operator will insert and update
    final updatedTodo = TodoEntity.fromDomain(todo);

    return db.writeTxn(() => db.todoEntitys.put(updatedTodo));
  }

  // delete
  @override
  Future<void> deleteTodoItem(int id) async {
    await db.writeTxn(() => db.todoEntitys.delete(id));
  }
}
