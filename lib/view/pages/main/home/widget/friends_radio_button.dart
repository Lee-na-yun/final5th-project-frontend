import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import './friends_radio_v2.dart';

enum ProductTypeEnum {
  friends1,
  friends2,
}

class FriendsRadioButton extends StatelessWidget {
  FriendsRadioButton({
    Key? key,
    required this.profileImg,
    required this.friendname,
    required this.value,
    required this.productTypeEnum,
    required this.onChanged,
  }) : super(key: key);

  String profileImg;
  String friendname;
  ProductTypeEnum value;
  ProductTypeEnum? productTypeEnum;
  Function(ProductTypeEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<ProductTypeEnum>(
        contentPadding: EdgeInsets.all(0),
        groupValue: productTypeEnum,
        onChanged: onChanged,
        dense: true,
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
                      image: AssetImage(profileImg), fit: BoxFit.cover),
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
                            text: friendname,
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
    );
  }
}
