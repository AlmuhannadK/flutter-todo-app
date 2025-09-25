//state management where each cubit is a list of todos

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/todo/presentation/cubit/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  // ref to repository
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super(TodoInitial()) {
    loadTodos();
  }

  // call from repo in presentation layer
  // load
  Future<void> loadTodos() async {
    emit(TodoLoading());

    await Future.delayed(
      Duration(seconds: 1),
    ); // simulate delay to see loading state
    final todos = await todoRepository.getTodoItems();
    emit(TodoLoaded(todos));
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
