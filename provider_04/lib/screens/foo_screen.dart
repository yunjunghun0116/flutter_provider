import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_04/models/foo.dart';

class FooScreen extends StatelessWidget {
  const FooScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider_04'),
      ),
      body: ChangeNotifierProvider(
        create: (context)=>Foo(),
        builder: (BuildContext context,Widget? child){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Provider.of<Foo>(context).value,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () =>Provider.of<Foo>(context,listen: false).changeValue(),
                  child: const Text(
                    'Value change',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
