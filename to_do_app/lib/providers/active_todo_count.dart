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

class ActiveTodoCount with ChangeNotifier {
  ActiveTodoCountState _state = ActiveTodoCountState.initial();
  ActiveTodoCountState get state => _state;

  void update(TodoList todoList) {
    final int newActiveTodoCount =
        todoList.state.todoList.where((Todo t) => !t.completed).toList().length;

    _state =  ActiveTodoCountState(activeTodoCount: newActiveTodoCount);
    notifyListeners();
  }
}
