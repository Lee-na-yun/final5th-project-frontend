import 'package:flutter/cupertino.dart';

class Board {
  String userImg;
  String name;
  List<String> boardImg;
  String title;
  String content;

  Board({
    required this.userImg,
    required this.name,
    required this.boardImg,
    required this.title,
    required this.content,
  });
}

List<Board> Boards = [
  Board(
    userImg: 'assets/Funny-Bunny.png',
    name: '이나윤',
    boardImg: [
      "assets/slide_9.jpg",
      "assets/slide_7.jpg",
      "assets/slide_1.jpg",
    ],
    title: '플러터 디자인중',
    content: '플러터 너무 어렵지만 열심히 하는중... 기능이 아주 편하긴 한데 어렵다!ㅠ_ㅠ 화이팅!',
  ),
  Board(
    userImg: 'assets/Funny-Bunny-2.png',
    name: '장성운',
    boardImg: [
      "assets/slide_2.jpg",
      "assets/slide_6.jpg",
      "assets/slide_11.jpg",
    ],
    title: '마지막 프로젝트도 드디어 끝이다..',
    content: '마지막 프로젝트도 드디어 끝이네 후.. 짧다면 짧고, 길다면 길었던 한 달! 열심히 했다!!',
  ),
  Board(
    userImg: 'assets/Funny-Bunny-3.png',
    name: '박서현',
    boardImg: [
      "assets/slide_4.jpg",
      "assets/slide_5.jpg",
      "assets/slide_3.jpg",
    ],
    title: '백엔드 정말 열심히한 나',
    content: '백엔드 자잘한 기능 너무 많았지만 열심히 했다. 이제 쉴래..',
  ),
  Board(
    userImg: 'assets/Funny-Bunny-4.png',
    name: '황지현',
    boardImg: [
      "assets/slide_8.jpg",
      "assets/slide_10.jpg",
      "assets/slide_12.jpg",
    ],
    title: '공부하는 여자..',
    content: '이번 프로젝틀르 하면서 spring 공부를 많이 하게 되었다.',
  ),
];
