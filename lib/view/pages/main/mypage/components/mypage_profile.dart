import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/mypage.dart';

class MypageProfile extends StatelessWidget {
  const MypageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/woman1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Container(
                  padding: EdgeInsets.all(0),
                  width: 160,
                  child: Text(
                    "이나윤" + "님",
                    style: textTheme().headline2,
                  ),
                ),
                subtitle: Container(
                  padding: EdgeInsets.all(0),
                  width: 160,
                  child: Text(
                    "반갑습니다. 함께 TODO해요!",
                    style: textTheme().bodyText2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: OutlinedButton(
                onPressed: () {},
                child: Text("프로필 수정",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9999A3),
                    )),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "팔로잉",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff1c1c1c),
                            ),
                          ),
                          Text(
                            "150",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1c1c1c),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 2,
                        height: 28,
                        color: Color(0xffe9e9e9),
                      ),
                      Column(
                        children: [
                          Text(
                            "팔로워",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff1c1c1c),
                            ),
                          ),
                          Text(
                            "9999",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1c1c1c),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
