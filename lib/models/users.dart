class User {
  String sender;
  String message;
  String profileImg;
  String sendDate;

  User({required this.sender, required this.message, required this.profileImg, required this.sendDate});
}

// 샘플 데이터
List<User> users = [
  User(
    sender: '이나윤',
    message: '파이널 프로젝트 화이팅! 5조 화이팅! 이번주까지 플러터 그림 그리기 완성하자..!',
    profileImg: 'assets/woman1.png',
    sendDate: '오전 9:02',
  ),
  User(
    sender: '장성운',
    message: '파이널 프로젝트 화이팅! 5조 화이팅!',
    profileImg: 'assets/man1.png',
    sendDate: '오후 14:10',
  ),
  User(
    sender: '황지현',
    message: '이메일 인증 완료했어요! 이제 백엔드 기능 테스트 진행 할게요~~',
    profileImg: 'assets/dog.png',
    sendDate: '오후 17:30',
  ),
  User(
    sender: '박서현',
    message: 'base64 어렵지만 잘 해결하는중..! 팀장님 DB 짜느라 고생하셨어요 ㅎㅎㅎ',
    profileImg: 'assets/man2.png',
    sendDate: '오전 10:00',
  ),
];
