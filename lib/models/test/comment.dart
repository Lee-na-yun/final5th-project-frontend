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

String CommentmyImg = 'assets/woman1.png';
String commentTitle = '플러터 디자인중';
String commentContent =
    '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ';

List<Comments> CommentList = [
  Comments(
    userImg: 'assets/woman1.png',
    friendName: '이나윤',
    comment:
        '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
  ),
  Comments(
    userImg: 'assets/man1.png',
    friendName: '장성운',
    comment:
        '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
  ),
  Comments(
    userImg: 'assets/dog.png',
    friendName: '박서현',
    comment:
        '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요! 최고최고최고!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
  ),
  Comments(
    userImg: 'assets/woman1.png',
    friendName: '닉네임',
    comment: '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요!',
  ),
  Comments(
    userImg: 'assets/man1.png',
    friendName: '닉네임',
    comment: '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요!',
  ),
  Comments(
    userImg: 'assets/dog.png',
    friendName: '닉네임',
    comment: '투두리스트도 되고 일정도 공유되고 너무 좋은 앱이에요!',
  ),
];
