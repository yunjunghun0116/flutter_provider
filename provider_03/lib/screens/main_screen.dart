import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dog.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider_03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' - name : ${context.watch<Dog>().name}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ' - number of babies : ${context.watch<int>()}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ' - ${context.watch<String>()}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '- breed : ${context.select<Dog, String>((Dog dog) => dog.breed)}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '- age : ${context.select<Dog, int>((Dog dog) => dog.age)}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<Dog>().grow(),
              child: const Text(
                'Grow',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
