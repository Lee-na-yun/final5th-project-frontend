import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/board.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/board_list_comment_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/slide_image.dart';

class BoardListBox extends StatelessWidget {
  BoardListBox({Key? key, required this.board}) : super(key: key);
  final Board board;

  int? activePage = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfile(),
          SizedBox(height: 8),
          Column(
            children: [
              SlideImage(),
            ],
          ),
          _buildFavoriteAndCommIcon(context),
          _buildText(),
        ],
      ),
    );
  }

  Row _buildProfile() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
                image: AssetImage(board.userImg), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        Text(
          board.name,
          style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
              .headline3,
        ),
      ],
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            board.title,
            style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                .bodyText1,
          ),
          SizedBox(height: 2),
          Text(
            board.content,
            style: textTheme(color: kPrimaryColor(), weight: FontWeight.w200)
                .bodyText1,
          )
        ],
      ),
    );
  }

  Row _buildFavoriteAndCommIcon(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          child: FavoriteButton(
            isFavorite: false,
            iconSize: 30,
            valueChanged: (_isFavorite) {
              print('Is Favorite : $_isFavorite');
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Container(
            //width: 15,
            height: 24,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BoardListCommentPage()),
                );
              },
              padding: EdgeInsets.only(top: 6),
              icon:
                  Image.asset("assets/icon_comment.png", width: 15, height: 15),
              //Icon(FontAwesomeIcons.comment)),
            ),
          ),
        ),
      ],
    );
  }
}
