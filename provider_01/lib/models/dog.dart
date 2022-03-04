import 'package:flutter/foundation.dart';

class Dog with ChangeNotifier{
  final String name;
  final String breed;
  int age;
  Dog({
    required this.name,
    required this.breed,
    this.age = 0,
  });

  void grow(){
    age++;
    notifyListeners();
  }

}
