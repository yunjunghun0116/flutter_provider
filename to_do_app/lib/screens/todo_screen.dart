import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/screens/components/todo_screen_create.dart';
import 'package:to_do_app/screens/components/todo_screen_filter_button.dart';
import 'package:to_do_app/screens/components/todo_screen_header.dart';
import 'package:to_do_app/screens/components/todo_screen_search_filter.dart';
import 'package:to_do_app/screens/components/todo_screen_todo_area.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: ListView(
                children: [
                  TodoScreenHeader(),
                  TodoScreenCreate(),
                  SizedBox(height: 20),
                  TodoScreenSearchFilter(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TodoScreenFilterButton(filter: Filter.all),
                      TodoScreenFilterButton(filter: Filter.active),
                      TodoScreenFilterButton(filter: Filter.completed),
                    ],
                  ),
                  TodoScreenTodoArea(),
                ],
              ),),),
    );
  }
}
