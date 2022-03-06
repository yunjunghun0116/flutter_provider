import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_04/models/counter.dart';
import 'package:provider_04/screens/counter_screen.dart';

import '../models/dog.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider_04'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Dog>(
            //child로 받는 인자는 Provider의 프로퍼티가 변경되어도 rebuild되지 않는다
            builder: (BuildContext context, Dog dog, Widget? child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    child!,
                    const SizedBox(height: 10),
                    Text(
                      ' - name : ${dog.name}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '- breed : ${dog.breed}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '- age : ${dog.age}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => dog.grow(),
                      child: const Text(
                        'Grow',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'This is my Pet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (counterContext) {
                  return ChangeNotifierProvider.value(
                    value: Provider.of<Counter>(context),
                    child: const CounterScreen(),
                  );
                }),
              );
            },
            child: const Text(
              'Go to CounterScreen',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () =>
                Provider.of<Counter>(context, listen: false).increment(),
            child: const Text(
              'Counter Increment',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
