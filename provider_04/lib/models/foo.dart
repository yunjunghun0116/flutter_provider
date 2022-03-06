import 'package:flutter/foundation.dart';

class Foo with ChangeNotifier{
  String value = 'Foo';

  void changeValue(){
    value = value == 'Foo'?'Bar':'Foo';
    notifyListeners();
  }

}