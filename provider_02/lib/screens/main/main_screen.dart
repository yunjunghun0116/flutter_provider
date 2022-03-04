import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_02/models/dog.dart';
import 'package:provider_02/screens/main/components/breed_and_age.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider_02'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' - name : ${context.watch<Dog>().name}',style: const TextStyle(
              fontSize: 20,
            ),),
            const SizedBox(height: 10),
            const BreedAndAge(),
          ],
        ),
      ),
    );
  }
}
