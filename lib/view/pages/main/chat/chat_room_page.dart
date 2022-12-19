import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/my_chat.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/other_chat.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';
import 'package:uuid/uuid.dart';

class TextMessage {
  int chatUserId;
  String chatMessageId; //randomId 사용할거라서 Stirng
  String chatUserName;
  String chatMessageContent;
  DateTime chatCreatedAt;

  TextMessage(
      {required this.chatUserId,
      required this.chatMessageId,
      required this.chatUserName,
      required this.chatMessageContent,
      required this.chatCreatedAt});
  Map<String, dynamic> toJson() {
    return {
      "chatUserId": chatUserId,
      "chatMessageId": chatMessageId,
      "chatUserName": chatUserName,
      "chatMessageContent": chatMessageContent,
      "chatCreatedAt": chatCreatedAt
    };
  }

  TextMessage.fromJson(Map<String, dynamic> json)
      : chatUserId = json["chatUserId"],
        chatMessageId = json["chatMessageId"],
        chatUserName = json["chatUserName"],
        chatMessageContent = json["chatMessageContent"],
        chatCreatedAt = json["chatCreatedAt"];
}

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key, this.user, this.chatroom, this.userInfo}) : super(key: key);
  final chatroom;
  final user;
  final userInfo;
  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  List<dynamic> _messageList = []; //다양한 타입으로 들어오고 보낼 수 있어서 dynamic
  String randomId = Uuid().v4(); //MessageId 를 랜덤하게 사용할거임 ( FireStore 특성 )
  final List<MyChat> chats = [];
  final TextEditingController _editingMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Logger().d("유저정보를 확인${widget.userInfo.user.userName}");
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(55), child: LineAppBar(widget.chatroom['name'], null)),
        body: Container(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('chat_room')
                        .doc(widget.chatroom['name'])
                        .collection('contents')
                        .orderBy('chatCreatedAt', descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<DocumentSnapshot> documents = snapshot.data!.docs;

                        return ListView(
                          //padding: EdgeInsets.only(top: 12, left: 20, right: 20),
                          children: List.generate(documents.length, (index) {
                            // int ts = 1638592424384;
                            // DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
                            // String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate); //DateFormat() is from intl package
                            // print(fdatetime); //output: 04-Dec-2021
                            Timestamp time = documents[index]['chatCreatedAt'];
                            DateTime parsedTimeDate = time.toDate();
                            Logger().d(parsedTimeDate);
                            return documents[index]['chatUserId'] == widget.userInfo.user.userId
                                ? MyChat(
                                    text: documents[index]['chatMessageContent'],
                                    time: DateFormat("a hh:mm")
                                        .format(parsedTimeDate)
                                        .replaceAll("AM", "오전")
                                        .replaceAll("PM", "오후"),
                                  )
                                : OtherChat(
                                    time: DateFormat("a hh:mm")
                                        .format(parsedTimeDate)
                                        .replaceAll("AM", "오전")
                                        .replaceAll("PM", "오후"),
                                    name: documents[index]['chatUserName'],
                                    text: documents[index]['chatMessageContent'],
                                  );
                          }),
                        );
                      }
                      return Center(child: Text('로드 중……'));
                    },
                  ),
                  // child: ListView.builder(
                  //   itemCount: _messageList.length,
                  //   itemBuilder: (context, index) => Column(
                  //     children: [
                  //       _messageList.isEmpty
                  //           ? Text("메세지가 없음")
                  //           : _messageList[index].chatUserId == 1
                  //               ? MyChat(
                  //                   text: _messageList[index].chatMessageContent,
                  //                   time: DateFormat("a hh:mm")
                  //                       .format(_messageList[index].chatCreatedAt)
                  //                       .replaceAll("AM", "오전")
                  //                       .replaceAll("PM", "오후"),
                  //                 )
                  //               : OtherChat(
                  //                   time: DateFormat("a hh:mm")
                  //                       .format(_messageList[index].chatCreatedAt)
                  //                       .replaceAll("AM", "오전")
                  //                       .replaceAll("PM", "오후"),
                  //                   name: _messageList[index].chatUserName,
                  //                   text: _messageList[index].chatMessageContent,
                  //                 ),
                  //     ],
                  //   ),
                  // ),
                ),
                _buildSubmitContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*  void _handlePreviewDataFetched(message, previewData) {
    final index = _messageList.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messageList[index].copyWith();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messageList[index] = updatedMessage;
      });
    });
  }*/

  void iniState() {
    _getMessage();
    super.initState();
  }

  void _addMessage(TextMessage message) async {
    setState(() {
      _messageList.insert(0, message);
    });
    await FirebaseFirestore.instance.collection('chat_room').doc(widget.chatroom['name']).collection('contents').add(
      {
        'chatUserId': message.chatUserId,
        'chatUserName': message.chatUserName,
        'chatCreatedAt': message.chatCreatedAt,
        'chatMessageId': message.chatMessageId,
        'chatMessageContent': message.chatMessageContent,
        //'안의이름은내가지정함'
      },
    );
  }

  void _getMessage() async {
    final getData = await FirebaseFirestore.instance
        .collection('chat_room')
        .doc("korea good")
        .collection('message')
        .orderBy('chatCreatedAt')
        .get();
    final messages = getData.docs
        .map(
          (e) => TextMessage(
            chatUserId: e.data()['chatUserId'], //FireStore 의 필드명
            chatMessageId: e.data()['chatMessageId'],
            chatUserName: e.data()['chatUserName'],
            chatCreatedAt: e.data()['chatCreatedAt'],
            chatMessageContent: e.data()['chatMessageContent'],
          ),
        )
        .toList(); //korea good 에 있는 메세지를 모두 들고올거기 때문에
    setState(() {
      _messageList = [...messages];
    });
  }

  Container _buildSubmitContainer() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xffd9d9d9),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icon_bottom_plus.svg", width: 24),
            padding: EdgeInsets.zero,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: _editingMessage,
                maxLines: 1,
                style: textTheme().headline3,
                decoration: InputDecoration(focusedBorder: InputBorder.none, enabledBorder: InputBorder.none),
                onSubmitted: _handleSubmitted,
              ),
              height: 40,
              //width: 226,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 6),
          _buildMsgSendButton(),
        ],
      ),
    );
  }

  Padding _buildMsgSendButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: theme().primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _handleSubmitted(_editingMessage);
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
          ),
          child: Text(
            "전송",
            style: textTheme(color: Colors.white, weight: FontWeight.w600).headline3,
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    final textMessage = TextMessage(
      chatUserId: widget.userInfo.user.userId, //로그인 한 유저의 아이디( 이것은 프로바이더 RiverPod 숙지하면 사용할 수 있음 )
      chatMessageId: randomId,
      chatUserName: widget.userInfo.user.userName,
      chatMessageContent: _editingMessage.text, //"작성된 메세지",
      chatCreatedAt: DateTime.now(),
    );
    _addMessage(textMessage);
    _editingMessage.clear();
  }
}
