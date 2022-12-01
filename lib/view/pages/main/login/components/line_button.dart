import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class LineButton extends StatelessWidget {
  const LineButton(this.btnText, this.routes, {Key? key}) : super(key: key);
  final String btnText;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, "${routes}");
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(double.infinity, 50),
          side: BorderSide(color: theme().primaryColor, width: 1),
        ),
        child: Text("${btnText}", style: textTheme(weight: FontWeight.w500).headline2),
      ),
    );
  }
}
