import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/domain/chat/chat.dart';
import 'package:riverpod_firestore_steam1/domain/chat/chat_firestore_repository.dart';

// final chatServiceProvider = StreamProvider<List<Chat>>((ref) {
//   Stream stream = ref.read(chatFireStoreRespositoryProvider).findAllStream();
//
//   //return
//   //return stream.map((event) => event.doc.map(
//   //(doc) => Chat(doc.id, doc,
//   //));
// });
