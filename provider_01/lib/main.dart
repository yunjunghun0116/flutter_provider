import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_01/screens/main/main_screen.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Dog>(
      create: (context) => Dog(
        name: 'Duri',
        breed: 'Maltease',
        age: 10,
      ),
      child: MaterialApp(
        title: 'Provider_01',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
