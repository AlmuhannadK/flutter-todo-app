import 'package:meta/meta.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';

//part of 'todo_state.dart';

@immutable
sealed class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}
