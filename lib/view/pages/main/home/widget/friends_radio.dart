import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';


enum Friends { name1, name2, name3, name4, name5, name6, name7 }

class FriendsRadio extends StatefulWidget {
  const FriendsRadio(int? index, {Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<FriendsRadio> createState() => _FriendsRadioState();
}

class _FriendsRadioState extends State<FriendsRadio> {
  Friends? _friends = Friends.name1;
  final List<User> userList = List.of(users);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //난중에 키보드 자판 생기면 해당 컬럼 짜그라치는 코드
        child: Column(
          children: [
            _buildRaioList(Friends.name1, 0),
            _buildRaioList(Friends.name2, 1),
            _buildRaioList(Friends.name3, 2),
            _buildRaioList(Friends.name4, 3),
            _buildRaioList(Friends.name5, 4),
            _buildRaioList(Friends.name5, 5),
            _buildRaioList(Friends.name5, 6),
            _buildRaioList(Friends.name5, 7),
          ],
        ),
      ),
    );
  }

  Widget _buildRaioList(Friends friends, int id) {
    return RadioListTile(
      value: friends,
      groupValue: _friends,
      onChanged: (Friends? value) {
        setState(() {
          _friends = value;
        });
        Navigator.pushNamed(context, "/friendPage");
      },
      title: _buildRadioListTitle(userList[id].profileImg, userList[id].sender),
    );
    ListTile(
      onTap: () {
        Navigator.pushNamed(context, "/myPage");
      },
      leading: Radio<Friends>(
        value: friends,
        groupValue: _friends,
        onChanged: (Friends? value) {
          setState(() {
            _friends = value;
          });
        },
      ),
      title: _buildRadioListTitle(userList[id].profileImg, userList[id].sender),
    );
  }

  Container _buildRadioListTitle(String image, String text) {
    return Container(
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
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 8),
              width: 175,
              child: Text.rich(
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                TextSpan(
                  //text: 'Hello ',
                  children: <TextSpan>[
                    TextSpan(
                        text: text,
                        style: textTheme(
                          color: kPrimaryColor(),
                        ).headline3),

                  ],
                ),
              ),
            ),
          ),
          //_buildFollowBtn("follow"),
        ],

      ),
    );
  }
}
