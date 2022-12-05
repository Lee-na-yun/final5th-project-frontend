import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme.dart';

class KInkWellIconButton extends StatelessWidget {
  const KInkWellIconButton({required this.img, this.icon, Key? key}) : super(key: key);

  final IconData? icon;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("클릭 됨 달력 아이콘");
      },
      child: Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: klightGreyColor(), borderRadius: BorderRadius.circular(6)),
        child: icon != null
            ? Icon(icon, size: 15)
            : ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("$img"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
