import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_03/models/babies.dart';
import 'package:provider_03/screens/main_screen.dart';
import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //위에있는 provider부터 하나하나 엮어준다
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(
            name: 'Duri',
            breed: 'Maltease',
            age: 10,
          ),
        ),
        // 위쪽에 Dog가 만들어져있어서 접근 가능
        FutureProvider<int>(
          initialData: 0,
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
        ),
        StreamProvider<String>(
          initialData: 'bark 0 times',
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge * 2);
            return babies.bark();
          },
        )
      ],
      child: MaterialApp(
        title: 'Provider_03',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
