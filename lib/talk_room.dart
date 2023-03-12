import 'package:badges/badges.dart';
import 'package:chat_app/account.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/model/room_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/provider.dart';
import 'package:chat_app/search_screen.dart';
import 'package:chat_app/talk_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// ルーム画面

class ChatRoomPage extends ConsumerWidget {
  ChatRoomPage({super.key});

  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ユーザリストを取得するプロバイダ
    final asyncValue = ref.watch(usersStreamProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Constant.whiteColor,
          centerTitle: false,
          elevation: 0,
          title: const Text(
            '友達',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountSetting()));
              },
              icon: const Icon(
                Icons.manage_accounts,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              /// 検索フィールド
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(width: 10),
                      const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 16),
                      const Text('検索'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// ユーザ一覧
              asyncValue.when(
                loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    )),
                error: (err, stack) => Text('Error:$err'),
                data: (data) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      if (data[index].room == null) {
                        return const Text('ルームがありません');
                      }
                      final myUid = FirebaseAuth.instance.currentUser!.uid;
                      return Visibility(
                        visible: data[index].uid != myUid,
                        child: UserCard(
                          friend: data[index],
                          room: data[index].room!,
                        ),
                      );
                    },
                  );
                },
              ),
            ]),
          ),
        ));
  }
}

/// ユーザ情報カード
class UserCard extends ConsumerWidget {
  const UserCard({
    Key? key,
    required this.friend,
    required this.room,
  }) : super(key: key);

  final UserModel friend;
  final RoomModel room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String originalImgURL = friend.profilePic != ''
        ? friend.profilePic!
        : Constant.anonymousProfilePic;
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoom(
              roomId: room.roomId,
              friend: room.friend!,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    originalImgURL,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      friend.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(room.recentMessage),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      DateFormat('MM/dd').format(room.recentMessageTime!),
                    ),
                    const SizedBox(height: 32),
                    room.unRead != 0
                        ? Badge(
                      badgeContent: Text(
                        room.unRead.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      position: BadgePosition.bottomStart(),
                      badgeStyle: const BadgeStyle(
                        elevation: 0,
                        badgeColor: Colors.amber,
                        padding: EdgeInsets.all(8),
                      ),
                      child: Container(),
                    )
                        : Container(),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.navigate_next_outlined),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
