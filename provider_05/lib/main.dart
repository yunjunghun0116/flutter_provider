import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_05/screens/counter_screen.dart';
import 'models/counter.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider_05',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: const MainScreen(),
            ),
        '/counter': (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: const CounterScreen(),
            ),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const MainScreen(),
              ),
            );
          case '/counter':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const CounterScreen(),
              ),
            );
        }
      },
    );
  }

  //원래는 ChangeNotifierProvider가 자동적으로 value를 dispose해주었지만, 이경우 직접 생성해준것이기때문에 직접 dispose해주어야한다
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}
