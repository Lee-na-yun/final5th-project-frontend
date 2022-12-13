import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({this.funPageRoute, Key? key, required this.btnText, required this.routes, Color? this.buttonColor, Color? this.fontColor})
      : super(key: key);
  final String btnText;
  final String routes;
  final buttonColor;
  final fontColor;
  final funPageRoute;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: funPageRoute,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(double.infinity, 52),
          elevation: 0.0,
        ),
        child: Text("${btnText}", style: textTheme(color: fontColor == null ? Colors.white : fontColor, weight: FontWeight.w500).headline2),
      ),
    );
  }
}
