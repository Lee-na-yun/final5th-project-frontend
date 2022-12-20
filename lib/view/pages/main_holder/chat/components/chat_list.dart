import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/provider/auth_provider.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/chat/chat_room_page.dart';

class ChatList extends ConsumerWidget {
  const ChatList({Key? key, required this.user, required this.chatroom})
      : super(key: key);
  final dynamic user;
  final dynamic chatroom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser userInfo = ref.watch(authProvider);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoomPage(
                user: user, chatroom: chatroom, userInfo: userInfo),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(user.profileImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    chatroom['name'], //user.sender,
                    style: textTheme(
                            color: kPrimaryColor(), weight: FontWeight.bold)
                        .headline3,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    user.message,
                    style: textTheme(color: kchacholGreyColor()).bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 0, right: 34),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    chatroom['createdAt'], //user.sendDate,
                    style: textTheme(
                            color: kchacholGreyColor(), weight: FontWeight.w600)
                        .bodyText2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
