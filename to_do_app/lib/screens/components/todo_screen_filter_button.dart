import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/providers/providers.dart';

class TodoScreenFilterButton extends StatelessWidget {
  final Filter filter;
  const TodoScreenFilterButton({Key? key, required this.filter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          Provider.of<TodoFilter>(context, listen: false).changeFilter(filter),
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 18,
          color: Provider.of<TodoFilter>(context).state.filter == filter
              ? Colors.blue
              : Colors.black,
        ),
      ),
    );
  }
}
