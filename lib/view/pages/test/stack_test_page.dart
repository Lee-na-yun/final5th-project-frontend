import 'package:flutter/material.dart';

class StackTestPage extends StatelessWidget {
  const StackTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
          child: Text("dd"),
        ),
      ),
    );
  }
}
