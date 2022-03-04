import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_01/models/dog.dart';
import 'package:provider_01/screens/main/components/breed_and_age.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' - name : ${Provider.of<Dog>(context).name}',style: TextStyle(
              fontSize: 20,
            ),),
            SizedBox(height: 10),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}
