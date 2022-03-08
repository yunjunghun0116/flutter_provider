import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context,['haha']);
          },
        ),
        title: Text('Success'),
      ),
      body: Center(
        child: Text(
          'Success',
          style: TextStyle(fontSize: 48.0),
        ),
      ),
    );
  }
}
