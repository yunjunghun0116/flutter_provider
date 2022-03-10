import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/filtered_todo_list.dart';
import 'package:to_do_app/screens/components/todo_screen_todo_card.dart';

class TodoScreenTodoArea extends StatelessWidget {
  const TodoScreenTodoArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoList =
        Provider.of<FilteredTodoList>(context).state.filteredTodoList;
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return TodoScreenTodoCard(todo: todoList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.grey);
      },
      itemCount: todoList.length,
    );
  }
}
