import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(this.btnText, {Key? key}) : super(key: key);
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/home");
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(double.infinity, 52),
          elevation: 0,
        ),
        child: Text("${btnText}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
