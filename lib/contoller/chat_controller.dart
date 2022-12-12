import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/dto/chat/chat_req_dto.dart';

import '../models/chat/chat_firestore_repository.dart';

final chatControllerProvider = Provider((ref) {
  return ChatController(ref);
});

class ChatController {
  Ref _ref;
  ChatController(this._ref);

  void insert(ChatInsertReqDto dto) {
    // DocumentReference doc = await _ref.read(chatFireStoreRespositoryProvider).insert(dto);
    // if (doc.id.isEmpty) {
    //   // AlertDialog 띄어주면 됨
    // } else {
    //   //잘 됐을 떄의 화면 이동을 구현 해주면 됨
    // }
    // print("디버그 : ${doc.snapshots()}"); // <--- 이게 Document 의 데이터
    // print("디버그 : ${doc.id}");
    Future<DocumentReference> doc =
        _ref.read(chatFireStoreRespositoryProvider).insert(dto);
    doc
        .then(
          // 잘 됐을 때
          (value) => {
            print("성공 디버그 : ${value.id}"),
            // Navigator.pushNamed(context, Routes.login.path);
            //     Navigator.popAndPushNamed(context, Routes.login.path);
            // Navigator.pop(context);
            // Navigator.pushNamedAndRemoveUntil(context, Routes.login.path, (route)=>false);
          },
        )
        .onError(
          // 잘 안됐을 때
          (error, stackTrace) => {print("실패 디버그 ")},
        );
  }
}
