import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isLoading,
    @Default('') String roomId,
  }) = _ChatState;
}

class ChatStateNotifier extends StateNotifier<ChatState> {
  ChatStateNotifier(this.roomId) : super(const ChatState()) {
    setReadUser();
  }

  final String roomId;

  // 開いたら既読つける
  Future<void> setReadUser() async {
    final unReadChats = await FirestoreService().getUnReadChats(roomId);
    // 全て既読にする
    for (var doc in unReadChats) {
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('chat')
          .doc(doc.id)
          .update({
        'readMembers':
        FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
    }
  }

// チャット送信ボタンフィールド
  Future<void> handleSendPressed(String message, String roomId) async {
    try {
      state = state.copyWith(isLoading: true);

      // 先にドキュメント生成
      final chatDoc = FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('chat')
          .doc();

      // fireStoreに保存するデータ
      final chatMessage = ChatModel(
        id: chatDoc.id,
        userId: FirebaseAuth.instance.currentUser!.uid,
        messageText: message,
        readMembers: [FirebaseAuth.instance.currentUser!.uid],
        sendTime: DateTime.now(),
        createdAt: DateTime.now(),
        // deviceTokens: deviceTokens,
      );

      // チャット登録
      await chatDoc.set(chatMessage.toJson());

      // roomの最新メッセージなども登録
      await FirebaseFirestore.instance.collection('rooms').doc(roomId).update({
        "recentMessage": message,
        "recentMessageSender": FirebaseAuth.instance.currentUser!.uid,
        "recentMessageTime": DateTime.now(),
      });
    } on Exception catch (e) {
      print(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
