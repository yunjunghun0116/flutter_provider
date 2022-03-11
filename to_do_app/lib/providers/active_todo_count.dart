import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/providers/todo_list.dart';

class ActiveTodoCountState {
  final int activeTodoCount;

  ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }
}

class ActiveTodoCount {
  final TodoList todoList;

  ActiveTodoCount({required this.todoList});

  ActiveTodoCountState get state => ActiveTodoCountState(
        activeTodoCount: todoList.state.todoList
            .where((Todo todo) => !todo.completed)
            .toList()
            .length,
      );
}
