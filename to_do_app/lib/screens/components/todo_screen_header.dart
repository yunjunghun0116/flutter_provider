import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/providers.dart';

class TodoScreenHeader extends StatelessWidget {
  const TodoScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Todo',style: TextStyle(
          fontSize:
            40,
        ),),
        Text('${Provider.of<TodoList>(context).state.todoList.length} items left',style: TextStyle(
          fontSize: 20,
          color: Colors.redAccent,
        ),)
      ],
    );
  }
}
