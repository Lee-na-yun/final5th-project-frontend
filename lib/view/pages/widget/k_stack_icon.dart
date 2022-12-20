import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class KStackIcon extends StatelessWidget {
  final iconData;
  final VoidCallback? onTap;
  final String notificationCount;

  const KStackIcon({
    Key? key,
    this.onTap,
    required this.iconData,
    required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35,
        //padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData),
              ],
            ),
            if (notificationCount != '0')
              Positioned(
                top: 4,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFde6344)),
                  child: Text(
                    notificationCount,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
