import 'package:flutter/material.dart';

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
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue[200 + top[index] % 4 * 100],
                      height: 100 + top[index] % 4 * 20.0,
                      child: Text('Item: ${top[index]}'),
                    ),
                  ],
                );
              },
              childCount: top.length,
            ),
          ),
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue[200 + bottom[index] % 4 * 100],
                      height: 100 + bottom[index] % 4 * 20.0,
                      child: Text('Item: ${bottom[index]}'),
                    ),
                  ],
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}
