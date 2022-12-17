import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// flutter_chat_uiを使うためのパッケージをインポート
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/core/util/response_util.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/model/main_page_view_model.dart';

//import 'package:provider/provider.dart';
// ランダムなIDを採番してくれるパッケージ
import 'package:uuid/uuid.dart';

import '../../../../models/user/user.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(this.name, {required this.sessionUser, Key? key}) : super(key: key);
  final String name;
  final SessionUser sessionUser;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  String randomId = Uuid().v4();
  //User userInfo = User.fromJson(widget.sessionUser.user);
  final _user = const types.User(id: '2', firstName: '성운');

  @override
  Widget build(BuildContext context) {
    Logger().d("출력 되는 것을 보자${widget.sessionUser.user.userName}");
    // String a = "abgd";
    //final username = const types.User(id: '2', firstName: '${a}');
    //const user = types.User(id: '2', firstName: 'username');
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
      ),
      body: Chat(
        theme: const DefaultChatTheme(
          inputBackgroundColor: primary,
          sendButtonIcon: Icon(Icons.send),
          sendingIcon: Icon(Icons.update_outlined),
        ),
        showUserNames: true,
        // メッセージの配列 / 메세지 배열
        messages: _messages,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: (value) {
          _handleSendPressed(value, widget.sessionUser.user.userName);
        },
        user: _user,
      ),
    );
  }

  void initState() {
    _getMessages();
    super.initState();
  }

  // firestoreからメッセージの内容をとってきて_messageにセット
  // 파이어 스토어에 담겨져 있는 메세지를 가져옴, User uid 로 가져오는 듯함
  void _getMessages() async {
    final getData =
        await FirebaseFirestore.instance.collection('chat_room').doc(widget.name).collection('contents').get();

    final message = getData.docs
        .map(
          (d) => types.TextMessage(
            author: types.User(
              id: d.data()['uid'],
              firstName: d.data()['name'],
            ),
            createdAt: d.data()['createdAt'],
            id: d.data()['id'],
            text: d.data()['text'],
          ),
        )
        .toList();

    setState(() {
      _messages = [...message];
    });
  }

  // メッセージ内容をfirestoreにセット
  // 파이어 베이스로 메시지 내용을 보냄
  void _addMessage(types.TextMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });
    await FirebaseFirestore.instance.collection('chat_room').doc(widget.name).collection('contents').add(
      {
        'uid': message.author.id,
        'name': message.author.firstName,
        'createdAt': message.createdAt,
        'id': message.id,
        'text': message.text,
      },
    );
  }

  // リンク添付時にリンクプレビューを表示する
  // 링크 첨부시 미리보기 생성
  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  // メッセージ送信時の処理 / 메세지 전송함
  void _handleSendPressed(types.PartialText message, name) {
    final textMessage = types.TextMessage(
      author: name,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomId,
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
