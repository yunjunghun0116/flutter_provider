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
          '- age : ${Provider.of<Dog>(context).age}',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Provider.of<Dog>(context,listen: false).grow(),
          child: Text(
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
