// local storage (isar) todo model

import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/domain/todo.dart';

// generate isar todo object
part 'todo_model.g.dart';

@collection
class TodoModel {
  Id id = Isar.autoIncrement; // auto increment id
  late String description;
  late bool isCompleted;


  // mappers for data obj to domain obj (vice versa)
  Todo toDomain() {
    return Todo(id: id, description: description, isCompleted: isCompleted);
  }

  static TodoModel fromDomain(Todo todo) {
    // note: this (..) is cascade operator which allows for multiple operations on the same object
    // equivalent to todoModel.id, todoModel.description = desc
    return TodoModel()
      ..id = todo.id
      ..description = todo.description
      ..isCompleted = todo.isCompleted;
  }
}
