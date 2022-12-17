class Comments {
  String userImg;
  String friendName;
  String comment;

  Comments({
    required this.userImg,
    required this.friendName,
    required this.comment,
  });
}

String commentmyImg = 'assets/Funny-Bunny.png';
String commentTitle = '플러터 디자인중';
String commentContent =
    '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ';

List<Comments> CommentList = [
  Comments(
    userImg: 'assets/Funny-Bunny-1.png',
    friendName: '장성운',
    comment: '고생했음!!',
  ),
  Comments(
    userImg: 'assets/Funny-Bunny-2.png',
    friendName: '박서현',
    comment: '우리 모두 너무 고생했어요 ㅠㅠ 5조 멋있다!',
  ),
  Comments(
    userImg: 'assets/Funny-Bunny-3.png',
    friendName: '황지현',
    comment: '벌써 학원이 끝이라니..',
  ),
  Comments(
    userImg: 'assets/Funny-Bunny-4.png',
    friendName: '최주호',
    comment: '6개월 동안 다들 고생 많았고, 건강하게 취업 준비도 열심히 하자!',
  ),
  Comments(
    userImg: 'assets/Funny-Bunny-5.png',
    friendName: '박서준',
    comment: '투두리스트라는 어플을 처음 알게 되었는데 디자인도 예쁘고 너무 맘에들어요 ^^',
  ),
  Comments(
    userImg: 'assets/Funny-Bunny-6.png',
    friendName: 'lala',
    comment: 'gooooooooooooooooood',
  ),
];
