//state management where each cubit is a list of todos

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/todo.dart';
import 'package:todo_app/domain/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // ref to repository
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super([]) {
    loadTodos();
  }

  // call from repo in presentation layer
  // load
  Future<void> loadTodos() async {
    final todos = await todoRepository.getTodoItems();
    emit(todos);
  }

  // add
  Future<void> addTodo(String str) async {
    final newTodo = Todo(id: DateTime.now().millisecond, description: str);
    await todoRepository.addTodoItem(newTodo);
    loadTodos();
  }

  // delete
  Future<void> deleteTodo(int id) async {
    await todoRepository.deleteTodoItem(id);
    loadTodos();
  }

  // toggle
  Future<void> toggleCompleted(Todo todo) async {
    final updatedTodo = todo.toggleCompleted();
    await todoRepository.updateTodoItem(updatedTodo);
    loadTodos();
  }
}
