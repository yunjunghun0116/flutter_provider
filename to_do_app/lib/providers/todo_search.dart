import 'package:flutter/foundation.dart';

class TodoSearchState {
  final String searchTerm;

  TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial(){
    return TodoSearchState(searchTerm: '');
  }

}

class TodoSearch with ChangeNotifier{
  TodoSearchState _state = TodoSearchState.initial();
  TodoSearchState get state => _state;

  void setSearchTerm(String newSearchTerm){
    _state = TodoSearchState(searchTerm: newSearchTerm);
    notifyListeners();
  }
}
