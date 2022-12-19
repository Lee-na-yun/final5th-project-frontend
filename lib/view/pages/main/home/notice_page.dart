import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';

class NoticePage extends StatelessWidget {
  NoticePage({Key? key}) : super(key: key);
  String friendImg = "assets/No-comments-3.png";
  String friendName = "장성운";
  String friendTodo = '"프로토타입 제작하기 및..."';
  String todoImg = "assets/slide_1.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("알림", null),
      ),
      body: _buildNoticeList(),
    );
  }

  Widget _buildNoticeList() {
    return ListView(
      children: [
        _buildNoticeFollow(),
        _buildNoticeTodo(),
        _buildNoticeComment(),
      ],
    );
  }

  Widget _buildNoticeComment() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("${friendImg}"), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 103),
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          //text: 'Hello ',
                          children: <TextSpan>[
                            TextSpan(
                                text: '${friendName}',
                                style: textTheme(
                                        color: kPrimaryColor(),
                                        weight: FontWeight.bold)
                                    .headline3),
                            TextSpan(
                              text: '님이 내 게시물에',
                              style:
                                  textTheme(color: kPrimaryColor()).headline3,
                            ),
                            TextSpan(
                              text: '댓글',
                              style: textTheme(
                                      color: kPrimaryColor(),
                                      weight: FontWeight.bold)
                                  .headline3,
                            ),
                            TextSpan(
                              text: '을 남겼습니다.',
                              style:
                                  textTheme(color: kPrimaryColor()).headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
    );
  }

  Widget _buildNoticeTodo() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("${friendImg}"), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 43),
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          //text: 'Hello ',
                          children: <TextSpan>[
                            TextSpan(
                                text: '${friendName}',
                                style: textTheme(
                                        color: kPrimaryColor(),
                                        weight: FontWeight.bold)
                                    .headline3),
                            TextSpan(
                              text: '님이',
                              style:
                                  textTheme(color: kPrimaryColor()).headline3,
                            ),
                            TextSpan(
                              text: '${friendTodo}',
                              style:
                                  textTheme(color: kPrimaryColor()).headline3,
                            ),
                            TextSpan(
                              text: ' 할 일을 완수했습니다.',
                              style: textTheme(
                                      color: kPrimaryColor(),
                                      weight: FontWeight.bold)
                                  .headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: todoImg != null,
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("${todoImg}"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
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
    );
  }

  Widget _buildNoticeFollow() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("${friendImg}"), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 43),
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          //text: 'Hello ',
                          children: <TextSpan>[
                            TextSpan(
                                text: '${friendName}',
                                style: textTheme(
                                        color: kPrimaryColor(),
                                        weight: FontWeight.bold)
                                    .headline3),
                            TextSpan(
                              text: '님이 회원님을 팔로우하기 시작했습니다.시작했습니다.시작했습니다.',
                              style:
                                  textTheme(color: kPrimaryColor()).headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _buildFollowBtn("follow"),
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
    );
  }

  Container _buildFollowBtn(String follow) {
    return Container(
        height: 28,
        margin: EdgeInsets.only(top: 6),
        child: follow == true
            ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 14, right: 14, bottom: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  elevation: 0.0,
                ),
                child: Text(
                  "팔로우",
                  style: textTheme().bodyText1,
                ),
              )
            : ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kchacholGreyColor(),
                  padding: EdgeInsets.only(left: 14, right: 14, bottom: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  elevation: 0.0,
                ),
                child: Text(
                  "팔로우 취소",
                  style: textTheme().bodyText1,
                ),
              ));
  }
}
