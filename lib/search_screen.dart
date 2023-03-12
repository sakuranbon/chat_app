import 'package:chat_app/account.dart';
import 'package:chat_app/model/room_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/talk_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'constant.dart';
import 'state/search_state.dart';

/// 検索画面
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late FocusNode focusNode;
  final TextEditingController searchEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constant.whiteColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSetting()),
              );
            },
            icon: const Icon(Icons.manage_accounts),
          )
        ],
        title: const Text(
          '友達',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    color: Colors.grey.shade200),
                child: Consumer(builder: (context, ref, child) {
                  final notifier = ref.watch(searchStateProvider.notifier);
                  return TextField(
                    onSubmitted: (value) {
                      // 検索
                      notifier.getSearchUser(searchEditingController.text);
                    },
                    controller: searchEditingController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      hintText: '検索',
                      hintStyle: TextStyle(color: Colors.grey, height: 1.7),
                      border: InputBorder.none,
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(searchStateProvider);
              return state.isLoading
                  ? Container()
                  : Container(
                child: state.hasUserSearched
                    ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.searchUsers.length,
                  itemBuilder: ((context, index) {
                    return _ChatUserTile(
                      friend: state.searchUsers[index],
                      room: state.searchUsers[index].room!,
                    );
                  }),
                )
                    : Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ChatUserTile extends ConsumerWidget {
  const _ChatUserTile({
    required this.friend,
    required this.room,
  });

  final UserModel friend;
  final RoomModel room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    friend.profilePic ?? Constant.anonymousProfilePic,
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
                Text(
                  DateFormat('MM/dd').format(room.recentMessageTime!),
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
