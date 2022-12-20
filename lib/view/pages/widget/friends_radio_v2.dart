import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/widget/friends_radio_button.dart';

enum ProductTypeEnum {
  friends1,
  friends2,
}

class FriendsRadio extends StatefulWidget {
  const FriendsRadio({Key? key}) : super(key: key);

  @override
  State<FriendsRadio> createState() => _FriendsRadioState();
}

class _FriendsRadioState extends State<FriendsRadio> {
  ProductTypeEnum? _productTypeEnum;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //난중에 키보드 자판 생기면 해당 컬럼 짜그라치는 코드
        child: Column(
          children: [
            // FriendsRadioButton(
            //   profileImg: "profileImg",
            //   friendname: "friendname",
            //   value: ProductTypeEnum.friends1,
            //   productTypeEnum: _productTypeEnum,
            //   onChanged: onChanged,
            // ),
          ],
        ),
      ),
    );
  }
}
