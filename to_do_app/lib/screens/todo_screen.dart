import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/components/todo_screen_header.dart';

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
         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: ListView(
            children: [
              TodoScreenHeader(),
            ],
          )
        )
      ),
    );
  }
}

