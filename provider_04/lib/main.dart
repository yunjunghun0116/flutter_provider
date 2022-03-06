import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_04/models/counter.dart';
import 'package:provider_04/screens/foo_screen.dart';
import 'screens/main_screen.dart';
import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(
            name: 'Duri',
            breed: 'Maltease',
            age: 10,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Provider_04',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => Counter(),
          builder: (BuildContext context, Widget? child) {
            return const MainScreen();
          },
        ),
      ),
    );
  }
}
