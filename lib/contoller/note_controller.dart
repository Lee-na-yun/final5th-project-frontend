import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/service/note_service.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/home/my_home_page_view_model.dart';

import '../models/session_user.dart';
import '../provider/auth_provider.dart';

final noteController = Provider<NoteController>((ref) {
  return NoteController(ref);
});

class NoteController {
  final mContext = navigatorKey.currentContext;
  late final NoteService writeService = NoteService();
  final Ref ref;

  NoteController(this.ref);

  Future<void> insert({required String title}) async {
    // 1. DTO 변환
    TodoReqDto todoReqDto = TodoReqDto(title: title);

    // 2. 통신 요청
    ResponseDto responseDto = await writeService.fetchInsert(
        todoReqDto, ref.read(authProvider).jwtToken);

    //Todo responseDto = await _ref.read(todoApiRepository).insert(todo);
    //_ref.read(todoListViewModel.notifier).addTodo(responseDto);

    // 3. 비지니스 로직 처리
    if (responseDto.code == 1) {
      Navigator.pop(mContext!);
      ref.read(myHomePageViewModel.notifier).notifyViewModel();
      // 4. 응답된 데이터를 ViewModel에 반영해야 한다면 통신 성공시에 추가하기
    } else {
      //젠장,, 아래의 cupertino다이얼로그는 안 뜸
      //showCupertinoDialog(context: mContext!, builder: (context) => MyAlertDialog(msg: "tlqkf"));
      //showDialog(context: mContext!, builder: (context) => MyAlertDialog(msg: "이메일 또는 비밀번호를 확인해 주세요"));
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("투두 작성 실패")),
      );
    }
  }
}
