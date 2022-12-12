import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/dto/chat/chat_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/chat/chat.dart';

final chatStreamProvider = StreamProvider.autoDispose<List<Chat>>((ref) {
  // .autoDispose 가 걸렸을 떄,
  // ref.onDispose(() { }); 로 Dispose 됐을 때 실행 될 것들을 실행 해줌 ( 데이터를 남기거나 할 수 있음 )
  // 외 다양한 것들이 있음

  //목적은 'stream' 을 리턴해주기 위함 이지만 , Stream 의 타입인 것을 chat 으로 파싱 해주기도 할거임
  Stream<QuerySnapshot<Map<String, dynamic>>> stream =
      FirebaseFirestore.instance.collection("chat").snapshots();
  return stream.map((snapshot) => snapshot.docs
      .map((doc) => Chat.fromJson(doc.data(), id: doc.id))
      .toList());
});

final chatFireStoreRespositoryProvider = Provider((ref) {
  return ChatFireStoreRepository();
});

class ChatFireStoreRepository {
  final db = FirebaseFirestore.instance;

  // Stream<QuerySnapshot<Map<String, dynamic>>> findAllStream() {
  //   //db.collection("chat/자동ID/comment"); // 컬렉션 내 컬렉션을 찾을 때
  //   //db.collection("chat").orderBy("createdAt").snapshots()
  //   return db.collection("chat").snapshots();
  // }

  Future<DocumentReference> insert(ChatInsertReqDto dto) {
    return db.collection("chat").add(dto.toJson());
    //db.collection("chat").add(dto.toJson()).then((value) => null).onError((error, stackTrace) => null);
    // .then 잘 됐을 때, .onError 잘 안됐으면~
  }
}
