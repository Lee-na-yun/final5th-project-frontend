import 'package:flutter/material.dart';

import '../../../../../core/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;

  final funPageRoute;

  const CustomElevatedButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),
        side: BorderSide(color: theme().primaryColor, width: 1),
      ),
      onPressed: funPageRoute,
      child: Text("$text", style: textTheme(weight: FontWeight.w500).headline2),
    );
  }
}
