import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/board.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/board_list_comment_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/slide_image.dart';

// List<String> images = [
//   "assets/board_1.png",
//   "assets/board_2.png",
//   "assets/board_3.png",
// ];

class BoardListBox extends StatelessWidget {
  BoardListBox({Key? key, required this.board}) : super(key: key);
  final Board board;
  //final CarouselController _controller = CarouselController();
  final _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
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
              SlideImage(board: board),
            ],
          ),
          _buildFavoriteAndCommIcon(context),
          _buildText(),
        ],
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: currentIndex == index ? Colors.black : Colors.black26, shape: BoxShape.circle),
      );
    });
  }

  Row _buildProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            image: DecorationImage(image: AssetImage(board.userImg), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        Text(
          board.name,
          style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline3,
        ),
      ],
    );
  }

  Column _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          board.title,
          style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline3,
        ),
        SizedBox(height: 4),
        Text(
          board.content,
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w200).bodyText1,
        )
      ],
    );
  }

  Widget _buildFavoriteAndCommIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
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
            padding: const EdgeInsets.only(left: 16, top: 6),
            child: Container(
              width: 16,
              height: 16,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BoardListCommentPage()),
                  );
                },
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset("assets/icon_comment.svg", width: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
