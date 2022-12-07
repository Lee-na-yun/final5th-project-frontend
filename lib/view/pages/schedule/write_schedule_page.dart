import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../../models/users.dart';

class WriteSchedule extends StatelessWidget {
  WriteSchedule({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  final List<User> userList = List.of(users);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    //위 패딩은 모달창의 터치 가능한 영역 내부 패딩
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            width: 50,
                            child: Divider(height: 1, color: kchacholGreyColor(), thickness: 4),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: _homePage("dj"),
        ),
      ],
    );
  }

  Widget _homePage(String? username) {
    return Center(
      child: Container(
          child: username != null
              ? Row(
                  children: [
                    Text("안녕, ", style: TextStyle(color: Colors.white)),
                    Text(username, style: TextStyle(color: Color(0xffFFD21D))),
                    Text("님:)", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 4),
                    Icon(CupertinoIcons.chevron_down, size: 14)
                  ],
                )
              : Text("마이페이지")),
    );
  }

  Widget _buildListItemsFREINDS(int index) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //난중에 키보드 자판 생기면 해당 컬럼 짜그라치는 코드
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("${userList[index].profileImg}"), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: 175,
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          //text: 'Hello ',
                          children: <TextSpan>[
                            TextSpan(
                                text: '${userList[index].sender}',
                                style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline3),
                            TextSpan(
                              text: '님이 회원님을 팔로우하기 시작했습니다.시작했습니다.시작했습니다.',
                              style: textTheme(color: kPrimaryColor()).headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //_buildFollowBtn("follow"),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: klightGreyColor(),
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
