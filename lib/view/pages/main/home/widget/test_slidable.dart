import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/todo.dart';

class TestSlidealbe extends StatelessWidget {
  TestSlidealbe({Key? key}) : super(key: key);

  final List<ToDo> items = List.of(ToDoList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Slidable(
            key: Key(items[1].content),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: const [
                SlidableAction(
                  onPressed: printSome,
                  backgroundColor: Color(0xFF7BC043),
                  //foregroundColor: kchacholGreyColor(),
                  icon: CupertinoIcons.gear_big,
                ),
                SlidableAction(
                  onPressed: printSome,
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: primary,
                  icon: CupertinoIcons.trash,
                ),
              ],
            ),
            child: const ListTile(title: Text('Slide me')),
          ),
        ],
      ),
    );
  }
}

void doNothing(BuildContext context) {}
void printSome(BuildContext context) {
  print("클릭됨");
}
