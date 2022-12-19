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
    message: '플러터 공부 합시다',
    profileImg: 'assets/Funny-Bunny.png',
    sendDate: '오전 9:02',
  ),
  User(
    sender: '장성운',
    message: '파이널 프로젝트 화이팅! 5조 화이팅!',
    profileImg: 'assets/Funny-Bunny-1.png',
    sendDate: '오후 14:10',
  ),
  User(
    sender: '황지현',
    message: '이메일 인증 완료했어요! 이제 백엔드 기능 테스트 진행 할게요~~',
    profileImg: 'assets/Funny-Bunny-2.png',
    sendDate: '오후 17:30',
  ),
  User(
    sender: '박서현',
    message: '난 정말 하얗게 불태웠음 ㅎㅎ',
    profileImg: 'assets/Funny-Bunny-3.png',
    sendDate: '오전 10:00',
  ),
  User(
    sender: '이민정',
    message: '어머 이 어플 너무 예뻐요!',
    profileImg: 'assets/Funny-Bunny-4.png',
    sendDate: '오후 17:30',
  ),
  User(
    sender: '최주호',
    message: '다들 6개월동안 고생 많았다! 앞으로가 시작이니 모두 건강하게 취업 준비도 잘 하자!',
    profileImg: 'assets/Funny-Bunny-5.png',
    sendDate: '오전 10:00',
  ),
  User(
    sender: 'lala',
    message: "It's a really pretty and useful application! I should spread the word to my friends",
    profileImg: 'assets/Funny-Bunny-6.png',
    sendDate: '오후 17:30',
  ),
  User(
    sender: '박서현',
    message: 'base64 어렵지만 잘 해결하는중..! 팀장님 DB 짜느라 고생하셨어요 ㅎㅎㅎ',
    profileImg: 'assets/Funny-Bunny-7.png',
    sendDate: '오전 10:00',
  ),
  User(
    sender: '황지현',
    message: '이메일 인증 완료했어요! 이제 백엔드 기능 테스트 진행 할게요~~',
    profileImg: 'assets/Funny-Bunny-8.png',
    sendDate: '오후 17:30',
  ),
  User(
    sender: '박서현',
    message: 'base64 어렵지만 잘 해결하는중..! 팀장님 DB 짜느라 고생하셨어요 ㅎㅎㅎ',
    profileImg: 'assets/man2.png',
    sendDate: '오전 10:00',
  ),
];
