// local storage (isar) todo model

import 'package:isar/isar.dart';
import 'package:todo_app/domain/todo.dart';

// generate isar todo object
part 'todo_entity.g.dart';

@collection
class TodoEntity {
  Id id = Isar.autoIncrement; // auto increment id
  late String description;
  late bool isCompleted;


  // mappers for data obj to domain obj (vice versa)
  Todo toDomain() {
    return Todo(id: id, description: description, isCompleted: isCompleted);
  }

  static TodoEntity fromDomain(Todo todo) {
    return TodoEntity()
      ..id = todo.id
      ..description = todo.description
      ..isCompleted = todo.isCompleted;
  }
}
