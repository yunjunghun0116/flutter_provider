import 'package:flutter/foundation.dart';

import '../models/todo.dart';

class TodoFilterState {
  final Filter filter;

  TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial(){
    return TodoFilterState(filter: Filter.all);
  }
}

class TodoFilter with ChangeNotifier{
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter){
    _state = TodoFilterState(filter: newFilter);
    notifyListeners();
  }
}

