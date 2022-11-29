import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Text("안녕, 그린컴퓨터님:)"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
      ),
    );
  }
}
