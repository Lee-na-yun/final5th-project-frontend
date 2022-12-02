import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(this.btnText, this.routes, {Key? key}) : super(key: key);
  final String btnText;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "${routes}");
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(double.infinity, 52),
          elevation: 0.0,
        ),
        child: Text("${btnText}", style: textTheme(color: Colors.white, weight: FontWeight.w500).headline2),
      ),
    );
  }
}
