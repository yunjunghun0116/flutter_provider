import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/providers/providers.dart';

class TodoScreenCreate extends StatefulWidget {
  const TodoScreenCreate({Key? key}) : super(key: key);

  @override
  _TodoScreenCreateState createState() => _TodoScreenCreateState();
}

class _TodoScreenCreateState extends State<TodoScreenCreate> {

  final TextEditingController newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: InputDecoration(
        labelText: 'What to do?',
      ),
      onSubmitted: (String s){
        if(s.isNotEmpty){
          Provider.of<TodoList>(context,listen: false).addTodo(s);
          newTodoController.clear();
        }
      },
    );
  }
}
