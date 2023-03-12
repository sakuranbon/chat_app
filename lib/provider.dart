import 'package:chat_app/constant.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/model/room_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/sharedpreference/sharedpreference.dart';
import 'package:chat_app/state/chat_room_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

// 全ユーザ情報受け取るプロバイダ
final usersStreamProvider = StreamProvider((ref) {
  return FirestoreService().getUsers();
});

// ChatStateとChatStateNotifierを動かすプロバイダー
final chatStateProvider = StateNotifierProvider.autoDispose
    .family<ChatStateNotifier, ChatState, String>(
      (ref, roomId) => ChatStateNotifier(roomId),
);

// Chatリストを受け取るプロバイダー
final chatStreamProvider = StreamProvider.family((ref, String roomId) {
  return FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('chat')
      .orderBy('sendTime')
      .snapshots();
});

// 現在のユーザ情報取得ストリーム
final currentUserProvider = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
});

/// FirebaseFirestore関連
class FirestoreService {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');
  final CollectionReference roomCollection =
  FirebaseFirestore.instance.collection('rooms');

  /// ユーザデータ登録
  Future savingUserData(String uid, String name, String email) async {
    var user = UserModel(
      uid: uid,
      name: name,
      email: email,
      profilePic: '',
      password: '',
    );
    return await userCollection.doc(uid).set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'profilePic': user.profilePic,
      'password': user.password,
    });
  }

  /// ユーザ情報取得
  Future gettingUserData(String email) async {
    QuerySnapshot querySnapshot =
    await userCollection.where('email', isEqualTo: email).get();
    return querySnapshot;
  }

  /// 現在ログインしているユーザのFirestore情報取得
  getCurrentUserModel() async {
    final model =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userModel = UserModel.fromSnapshot(model);
    return userModel;
  }

  /// 登録ユーザ全て取得stream
  Stream<List<UserModel>> getUsers() async* {
    // 1秒ごとに繰り返す
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      // 全ユーザ取得
      final users = await FirebaseFirestore.instance.collection('users').get();

      // 所属済みの全ルーム取得
      final snapshots = await FirebaseFirestore.instance
          .collection('rooms')
          .where('members', arrayContains: uid)
          .get();

      final list = <UserModel>[];
      for (var user in users.docs) {
        final userModel = UserModel.fromSnapshot(user);

        // 絞り込んだルームリストから各々の相手のルーム取得
        final friendRoom = snapshots.docs.where((snapshot) =>
            RoomModel.fromSnapshot(snapshot).members.contains(userModel.uid));

        RoomModel? room;
        if (friendRoom.isNotEmpty) {
          // room作成済みの場合
          final roomModel = RoomModel.fromSnapshot(friendRoom.first);
          final unReadChats = await getUnReadChats(roomModel.roomId);
          room = roomModel.copyWith(
            friend: userModel,
            unRead: unReadChats.length,
          );
        } else {
          // なければ作成する
          final roomModel = await createRoom(userModel.uid);
          final unReadChats = await getUnReadChats(roomModel.roomId);
          room = roomModel.copyWith(
            friend: userModel,
            unRead: unReadChats.length,
          );
        }

        final model = userModel.copyWith(room: room);
        list.add(model);
      }
      yield list;
    }
  }

  /// ユーザ検索
  Future<List<UserModel>> searchAllUser(String userName) async {
    List<UserModel> searchUsers = [];
    // 名前が一致する全ユーザを取得
    final users = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: userName)
        .get();

    // 所属済みの全ルーム取得
    final snapshots = await FirebaseFirestore.instance
        .collection('rooms')
        .where('members', arrayContains: uid)
        .get();
    for (var user in users.docs) {
      final userModel = UserModel.fromSnapshot(user);

      // 絞り込んだルームリストから各々の相手のルーム取得
      final friendRoom = snapshots.docs.where((snapshot) =>
          RoomModel.fromSnapshot(snapshot).members.contains(userModel.uid));

      RoomModel? room;
      if (friendRoom.isNotEmpty) {
        // room作成済みの場合
        final roomModel = RoomModel.fromSnapshot(friendRoom.first);
        final unReadChats = await getUnReadChats(roomModel.roomId);
        room = roomModel.copyWith(
          friend: userModel,
          unRead: unReadChats.length,
        );
      } else {
        // なければ作成する
        final roomModel = await createRoom(userModel.uid);
        final unReadChats = await getUnReadChats(roomModel.roomId);
        room = roomModel.copyWith(
          friend: userModel,
          unRead: unReadChats.length,
        );
      }

      final model = userModel.copyWith(room: room);
      searchUsers.add(model);
    }
    return searchUsers;
  }

  /// ルーム作成
  Future<RoomModel> createRoom(String friendUid) async {
    // roomコレクションの中に新しくドキュメント生成
    final room = roomCollection.doc();
    // ドキュメントに中身追加
    await room.set(
      RoomModel(
        roomId: room.id,
        members: [uid!, friendUid],
        // 自分のuidと友達のuidの配列をセット
        recentMessage: '',
        recentMessageSender: '',
        recentMessageTime: DateTime.now(),
        createdAt: DateTime.now(),
      ).toJson(),
    );
    // セット後、再取得
    final doc =
    await FirebaseFirestore.instance.collection('rooms').doc(room.id).get();
    // モデルにはめ込みreturnする
    final roomModel = RoomModel.fromSnapshot(doc);
    return roomModel;
  }

  /// 未読チャットリスト取得
  Future<List<ChatModel>> getUnReadChats(String roomId) async {
    // ルーム内のチャット取得
    final chats = await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('chat')
        .get();
    // 未読のchatリスト作成
    final unReadList = chats.docs.where((doc) {
      final memb = doc.data()['readMembers'] as List<dynamic>;
      return !memb.contains(FirebaseAuth.instance.currentUser!.uid);
    }).toList();
    // モデルにはめ込み
    final unReadModelList =
    unReadList.map((e) => ChatModel.fromSnapshot(e)).toList();
    return unReadModelList;
  }
}

/// FirebaseAuthentication関連
class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// ログイン
  Future<EmailLogInResults> logInUserWithEmailandPassword(
      String email, String password) async {
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password))
          .user;
      if (user != null) {
        return EmailLogInResults.LogInCompleted;
      } else {
        final bool logOutResponse = await signOut();
        if (logOutResponse) return EmailLogInResults.EmailNotVerified;
        return EmailLogInResults.UnexpectedError;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return EmailLogInResults.EmailPasswordInvalid;
    }
  }

  /// 新規登録
  Future<EmailSignResults> registerUserWithEmailandPassword(
      String name,
      String email,
      String password,
      ) async {
    try {
      (await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password))
          .user;
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password))
          .user;
      await FirestoreService().savingUserData(user!.uid, name, email);
      return EmailSignResults.SignUpCompleted;
    } on FirebaseAuthException catch (e) {
      print(e);
      return EmailSignResults.EmailAlreadyPresent;
    }
  }

  /// ログアウト
  Future signOut() async {
    try {
      await SharedPreferencesData().saveUserLoggedInStatus(false);
      await SharedPreferencesData().saveUserEmailSF('');
      await SharedPreferencesData().saveUserNameSF('');
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
