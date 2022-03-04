import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_02/screens/main/components/age.dart';

import '../../../models/dog.dart';

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed : ${context.select<Dog,String>((Dog dog)=>dog.breed)}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        const Age(),
      ],
    );
  }
}
