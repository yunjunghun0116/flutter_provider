import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/todo.dart';

class TodoListState {
  List<Todo> todoList;

  TodoListState({
    required this.todoList,
  });

  factory TodoListState.initial() {
    return TodoListState(
      todoList: [
        Todo(id: '1', desc: 'Practice Provider'),
        Todo(id: '2', desc: 'Make TodoApp'),
        Todo(id: '3', desc: 'Check university class'),
      ],
    );
  }
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String newTodo) {
    _state.todoList.add(
      Todo(
        id: (_state.todoList.length + 1).toString(),
        desc: newTodo,
      ),
    );
    notifyListeners();
  }

  void editTodo(String id, String todoDesc) {
    List<Todo> newTodoList = _state.todoList.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: todoDesc, completed: todo.completed);
      }
      return todo;
    }).toList();

    _state = TodoListState(todoList: newTodoList);
    notifyListeners();
  }

  void toggleTodo(String id) {
    List<Todo> newTodoList = _state.todoList.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();

    _state = TodoListState(todoList: newTodoList);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _state.todoList.removeWhere(
      (Todo rtodo) => rtodo.id == todo.id,
    );
    notifyListeners();
  }
}
