import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/providers.dart';
import 'screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(
          create: (context) => TodoFilter(),
        ),
        ChangeNotifierProvider<TodoList>(
          create: (context) => TodoList(),
        ),
        ChangeNotifierProvider<TodoSearch>(
          create: (context) => TodoSearch(),
        ),
        ProxyProvider<TodoList, ActiveTodoCount>(update: (BuildContext context,
            TodoList todoList, ActiveTodoCount? activeTodoCount) {
          return ActiveTodoCount(todoList: todoList);
        }),
        ProxyProvider3<TodoFilter, TodoSearch, TodoList, FilteredTodoList>(
          update: (BuildContext context,
              TodoFilter todoFilter,
              TodoSearch todoSearch,
              TodoList todoList,
              FilteredTodoList? filteredTodoList) {
            return FilteredTodoList(
              todoSearch: todoSearch,
              todoList: todoList,
              todoFilter: todoFilter,
            );
          },
        ),
      ],
      child: MaterialApp(
        title: 'TODOS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
