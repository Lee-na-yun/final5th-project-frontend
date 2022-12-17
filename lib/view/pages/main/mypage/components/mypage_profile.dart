import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/mypage.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/mypage_follow_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/mypage_following_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/mypage_profile_page.dart';

class MypageProfile extends StatelessWidget {
  const MypageProfile({Key? key, this.userInfo}) : super(key: key);
  final userInfo;
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
                        image: AssetImage("assets/Funny-Bunny.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Container(
                  padding: EdgeInsets.all(0),
                  width: 160,
                  child: Text(
                    "${userInfo.user.userName}" + "님",
                    style: textTheme(
                            color: kPrimaryColor(), weight: FontWeight.bold)
                        .headline2,
                  ),
                ),
                subtitle: Container(
                  padding: EdgeInsets.all(0),
                  width: 160,
                  child: Text(
                    "반갑습니다. 함께 TODO해요!",
                    style: textTheme(color: kchacholGreyColor()).bodyText2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPageProfilePage()),
                  );
                },
                child: Text("프로필 수정",
                    style: textTheme(
                            color: kchacholGreyColor(), weight: FontWeight.w600)
                        .bodyText1),
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
        _buildFollowCount(context, 150, 999),
      ],
    );
  }

  Padding _buildFollowCount(BuildContext context, int count, int count2) {
    return Padding(
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPageFollowingPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "팔로잉",
                          style: textTheme(color: kPrimaryColor()).bodyText1,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "$count",
                          style: textTheme(
                                  color: kPrimaryColor(),
                                  weight: FontWeight.bold)
                              .headline3,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 28,
                    color: Color(0xffe9e9e9),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPageFollowPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "팔로워",
                          style: textTheme(color: kPrimaryColor()).bodyText1,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "$count2",
                          style: textTheme(
                                  color: kPrimaryColor(),
                                  weight: FontWeight.bold)
                              .headline3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
