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
        ChangeNotifierProxyProvider<TodoList, ActiveTodoCount>(
            create: (context) => ActiveTodoCount(
                  initialActiveTodoCount:
                      Provider.of<TodoList>(context, listen: false)
                          .state
                          .todoList
                          .length,
                ),
            update: (BuildContext context, TodoList todoList,
                ActiveTodoCount? activeTodoCount) {
              activeTodoCount!.update(todoList);
              return activeTodoCount;
            }),
        ChangeNotifierProxyProvider3<TodoFilter, TodoSearch, TodoList,
            FilteredTodoList>(
          create: (context) => FilteredTodoList(),
          update: (BuildContext context,
              TodoFilter todoFilter,
              TodoSearch todoSearch,
              TodoList todoList,
              FilteredTodoList? filteredTodoList) {
            filteredTodoList!.update(todoFilter, todoSearch, todoList);
            return filteredTodoList;
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
