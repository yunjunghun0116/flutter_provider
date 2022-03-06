import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_04/models/counter.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Text(
          '${Provider.of<Counter>(context).counter}',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
