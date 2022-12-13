import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';

enum ProductTypeEnum {
  friends1,
  friends2,
  friends3,
  friends4,
  friends5,
  friends6,
  friends7,
  friends8,
  friends9
}

class FriendsRadio extends StatefulWidget {
  const FriendsRadio(int? index, {Key? key, required this.user})
      : super(key: key);
  final User user;

  @override
  State<FriendsRadio> createState() => _FriendsRadioState(user);
}

class _FriendsRadioState extends State<FriendsRadio> {
  ProductTypeEnum? _productTypeEnum;
  final List<User> userList = List.of(users);

  int? index;

  _FriendsRadioState(user);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //난중에 키보드 자판 생기면 해당 컬럼 짜그라치는 코드
        child: Column(
          children: [
            RadioListTile<ProductTypeEnum>(
              contentPadding: EdgeInsets.all(0),
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
              value: ProductTypeEnum.friends1,
              title: Container(
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
                        image: DecorationImage(
                            image: AssetImage(userList[1].profileImg),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: 175,
                        child: Text.rich(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TextSpan(
                            //text: 'Hello ',
                            children: <TextSpan>[
                              TextSpan(
                                  text: userList[1].sender,
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
              ),
            ),
            RadioListTile<ProductTypeEnum>(
              contentPadding: EdgeInsets.all(0),
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
              value: ProductTypeEnum.friends1,
              title: Container(
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
                        image: DecorationImage(
                            image: AssetImage(userList[2].profileImg),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: 175,
                        child: Text.rich(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TextSpan(
                            //text: 'Hello ',
                            children: <TextSpan>[
                              TextSpan(
                                  text: userList[2].sender,
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
              ),
            ),
            RadioListTile<ProductTypeEnum>(
              contentPadding: EdgeInsets.all(0),
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
              value: ProductTypeEnum.friends1,
              title: Container(
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
                        image: DecorationImage(
                            image: AssetImage(userList[3].profileImg),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: 175,
                        child: Text.rich(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TextSpan(
                            //text: 'Hello ',
                            children: <TextSpan>[
                              TextSpan(
                                  text: userList[3].sender,
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
              ),
            ),
            RadioListTile<ProductTypeEnum>(
              contentPadding: EdgeInsets.all(0),
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
              value: ProductTypeEnum.friends1,
              title: Container(
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
                        image: DecorationImage(
                            image: AssetImage(userList[0].profileImg),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: 175,
                        child: Text.rich(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          TextSpan(
                            //text: 'Hello ',
                            children: <TextSpan>[
                              TextSpan(
                                  text: userList[0].sender,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
