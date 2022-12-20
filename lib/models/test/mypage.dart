class MyPage {
  String myImg;
  String name;
  String intro;
  int followingCount;
  int followCount;

  MyPage({
    required this.myImg,
    required this.name,
    required this.intro,
    required this.followingCount,
    required this.followCount,
  });
}

// 샘플 데이터
List<MyPage> MyPages = [
  MyPage(
    myImg: 'assets/Funny-Bunny.png',
    name: '이나윤',
    intro: '반갑습니다, 함께 TODO해요!',
    followingCount: 150,
    followCount: 9999,
  )
];
