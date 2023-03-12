import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'model/chat_model.dart';


class ChatRoom extends ConsumerWidget {
  ChatRoom({
    required this.roomId,
    required this.friend,
    Key? key,
  }) : super(key: key);

  final String roomId;
  final UserModel friend;

  TextEditingController messageEditingController = TextEditingController();
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(chatStreamProvider(roomId));
    final notifier = ref.watch(chatStateProvider(roomId).notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          friend.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: asyncValue.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: data.docs.map((e) {
                        notifier.setReadUser();

                        final chat = ChatModel.fromSnapshot(e);

                        bool sendByMe = false;
                        if (FirebaseAuth.instance.currentUser!.uid == chat.userId) {
                          sendByMe = true;
                        }

                        final sendTime = DateFormat('HH:mm').format(chat.sendTime!);

                        return Container(
                          alignment: sendByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                margin: sendByMe
                                    ? const EdgeInsets.only(left: 30)
                                    : const EdgeInsets.only(right: 30),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    color: sendByMe ? Colors.amber : Colors.grey),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 6),
                                    Text(
                                      chat.messageText,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(sendTime),
                            ],
                          ),
                        );
                      }).toList(),
                    )),


                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
                  child: TextFormField(
                    controller: messageEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'メッセージ',
                      suffixIcon: IconButton(
                        onPressed: () {
                          notifier.handleSendPressed(
                            messageEditingController.text,
                            roomId,
                          );
                          messageEditingController.clear();
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            )),
        error: (err, stack) => Text('Error:$err'),
      ),
    );
  }
}
