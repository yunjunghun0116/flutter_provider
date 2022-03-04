import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/dog.dart';

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age : ${context.select<Dog,int>((Dog dog) => dog.age)}',
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
    );
  }
}
