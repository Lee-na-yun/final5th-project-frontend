import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/follow.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/follow_box.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/following_box.dart';
import '../components/line_app_bar.dart';

class MyPageFollowingPage extends StatefulWidget {
  const MyPageFollowingPage({Key? key}) : super(key: key);

  @override
  State<MyPageFollowingPage> createState() => _MyPageFollowingPageState();
}

class _MyPageFollowingPageState extends State<MyPageFollowingPage> with SingleTickerProviderStateMixin {
  TabController? _tabController2;

  @override
  void initState() {
    super.initState();
    _tabController2 = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("이나윤님", null),
      ),
      body: Column(
        children: [
          _buildTabBar(),
          _buildSearchBox(),
          SizedBox(height: 8),
          Expanded(child: _buildTabBarView2()),
        ],
      ),
    );
  }

  Padding _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: klightGreyColor(),
              hintText: "닉네임을 검색하세요",
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              isDense: true,
              hintStyle: textTheme(color: kchacholGreyColor(), weight: FontWeight.bold).headline3,
              suffixIcon: Image.asset("assets/magnifier_icon.png")),
          keyboardType: TextInputType.text),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: kmidGreyColor()),
        ),
      ),
      child: TabBar(
        labelColor: createMaterialColor(Color(0xff6E34DA)),
        labelStyle: textTheme(weight: FontWeight.bold).headline3,
        unselectedLabelColor: kchacholGreyColor(),
        unselectedLabelStyle: textTheme(weight: FontWeight.w500).headline3,
        indicatorWeight: 3,
        controller: _tabController2,
        tabs: [
          Tab(child: Text("팔로잉")),
          Tab(child: Text("팔로워")),
        ],
      ),
    );
  }

  Widget _buildTabBarView2() {
    return TabBarView(
      controller: _tabController2,
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          children: List.generate(
            Follows.length,
            (index) => FollowingBox(follow: Follows[index]),
          ),
        ),
        ListView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          children: List.generate(
            Follows.length,
            (index) => FollowBox(follow: Follows[index]),
          ),
        ),
      ],
    );
  }
}
