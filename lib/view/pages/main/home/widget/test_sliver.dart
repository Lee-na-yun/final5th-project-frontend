import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/home_page_top.dart';

class TestSliver extends StatelessWidget {
  const TestSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return RowList();
  }
}

class RowList extends StatefulWidget {
  const RowList({super.key});

  @override
  State<RowList> createState() => _RowList();
}

class _RowList extends State<RowList> {
  List<int> top = <int>[88, 8888, 8, 8, 888, 88, 8, 8, 8, 88];
  List<int> bottom = <int>[444, 4, 4, 4, 4, 44, 4, 4, 444, 4];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Press on the plus to add items above and below'),
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                top.add(-top.length - 1);
                bottom.add(bottom.length);
              });
            },
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 360.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 20),
                title: Text(
                  textAlign: TextAlign.left,
                  'ToDo',
                  style: TextStyle(fontSize: 16, color: Color(0xFF1c1c1c)),
                ),
                background: HomePageTop(),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: _TimelineList(),
                );
              }, childCount: 10),
            ),
          ],
        ));
  }

  Widget _TimelineList() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: klightGreyColor(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: kchacholGreyColor(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "플러터 디자인 하기",
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.w500).headline3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
