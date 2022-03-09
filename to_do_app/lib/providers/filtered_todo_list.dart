import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/providers/todo_filter.dart';
import 'package:to_do_app/providers/todo_list.dart';
import 'package:to_do_app/providers/todo_search.dart';

class FilteredTodoListState {
  final List<Todo> filteredTodoList;

  FilteredTodoListState({
    required this.filteredTodoList,
  });

  factory FilteredTodoListState.initial() {
    return FilteredTodoListState(filteredTodoList: []);
  }
}

class FilteredTodoList with ChangeNotifier {
  FilteredTodoListState _state = FilteredTodoListState.initial();
  FilteredTodoListState get state => _state;

  void update(
    TodoFilter todoFilter,
    TodoSearch todoSearchTerm,
    TodoList todoList,
  ) {
    List<Todo> _filteredTodoList = [];
    switch (todoFilter.state.filter) {
      case Filter.active:
        _filteredTodoList = todoList.state.todoList
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodoList = todoList.state.todoList
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
      default:
        _filteredTodoList = todoList.state.todoList;
        break;
    }

    if (todoSearchTerm.state.searchTerm.isNotEmpty) {
      //검색어 필터링 하기
      _filteredTodoList = _filteredTodoList
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchTerm.state.searchTerm.toLowerCase()))
          .toList();
    }

    _state = FilteredTodoListState(filteredTodoList: _filteredTodoList);
    notifyListeners();
  }
}
