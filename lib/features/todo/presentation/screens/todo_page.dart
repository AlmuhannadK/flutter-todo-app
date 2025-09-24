// provide cubit to UI
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepository todoRepository;
  const TodoPage({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepository),
      child: const TodoView(),
    );
  }
}
