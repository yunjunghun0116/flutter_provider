import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/providers.dart';
import 'package:to_do_app/utils/debounce.dart';

class TodoScreenSearchFilter extends StatelessWidget {
  TodoScreenSearchFilter({Key? key}) : super(key: key);
  final debounce = Debounce(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Search Todo',
        border: InputBorder.none,
        filled: true,
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (String s) {
        debounce.run(() {
          Provider.of<TodoSearch>(context, listen: false).setSearchTerm(s);
          print('check');
        });
      },
    );
  }
}
