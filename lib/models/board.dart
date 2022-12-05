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
    userImg: 'assets/woman1.png',
    name: '이나윤',
    boardImg: ['assets/board_1.png', 'assets/board_2.png', 'assets/board_3.png'],
    title: '플러터 디자인중',
    content: '플러터 너무 어렵지만 열심히 하는중... 기능이 아주 편하긴 한데 어렵다!ㅠ_ㅠ 화이팅!',

  ),
  Board(
    userImg: 'assets/man1.png',
    name: '장성운',
    boardImg: ['assets/board_1.png', 'assets/board_2.png', 'assets/board_3.png'],
    title: '플러터 디자인중',
    content: '플러터 너무 어렵지만 열심히 하는중... 기능이 아주 편하긴 한데 어렵다!ㅠ_ㅠ 화이팅!',

  ),
  Board(
    userImg: 'assets/dog.png',
    name: '박서현',
    boardImg: ['assets/man_1.png'],
    title: '백엔드 진행중',
    content: '백엔드 자잘한 기능 너무 많지만 열심히 하는중! 화이팅!',

  ),
];
