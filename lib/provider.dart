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


final usersStreamProvider = StreamProvider((ref) {
  return FirestoreService().getUsers();
});


final chatStateProvider = StateNotifierProvider.autoDispose
    .family<ChatStateNotifier, ChatState, String>(
      (ref, roomId) => ChatStateNotifier(roomId),
);


final chatStreamProvider = StreamProvider.family((ref, String roomId) {
  return FirebaseFirestore.instance
      .collection('rooms')
      .doc(roomId)
      .collection('chat')
      .orderBy('sendTime')
      .snapshots();
});


final currentUserProvider = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
});


class FirestoreService {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');
  final CollectionReference roomCollection =
  FirebaseFirestore.instance.collection('rooms');


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

  Future gettingUserData(String email) async {
    QuerySnapshot querySnapshot =
    await userCollection.where('email', isEqualTo: email).get();
    return querySnapshot;
  }

  getCurrentUserModel() async {
    final model =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userModel = UserModel.fromSnapshot(model);
    return userModel;
  }

  Stream<List<UserModel>> getUsers() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      final users = await FirebaseFirestore.instance.collection('users').get();
      final snapshots = await FirebaseFirestore.instance
          .collection('rooms')
          .where('members', arrayContains: uid)
          .get();

      final list = <UserModel>[];
      for (var user in users.docs) {
        final userModel = UserModel.fromSnapshot(user);

        final friendRoom = snapshots.docs.where((snapshot) =>
            RoomModel.fromSnapshot(snapshot).members.contains(userModel.uid));

        RoomModel? room;
        if (friendRoom.isNotEmpty) {
          final roomModel = RoomModel.fromSnapshot(friendRoom.first);
          final unReadChats = await getUnReadChats(roomModel.roomId);
          room = roomModel.copyWith(
            friend: userModel,
            unRead: unReadChats.length,
          );
        } else {
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


  Future<List<UserModel>> searchAllUser(String userName) async {
    List<UserModel> searchUsers = [];
    final users = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: userName)
        .get();

    final snapshots = await FirebaseFirestore.instance
        .collection('rooms')
        .where('members', arrayContains: uid)
        .get();
    for (var user in users.docs) {
      final userModel = UserModel.fromSnapshot(user);

      final friendRoom = snapshots.docs.where((snapshot) =>
          RoomModel.fromSnapshot(snapshot).members.contains(userModel.uid));

      RoomModel? room;
      if (friendRoom.isNotEmpty) {
        final roomModel = RoomModel.fromSnapshot(friendRoom.first);
        final unReadChats = await getUnReadChats(roomModel.roomId);
        room = roomModel.copyWith(
          friend: userModel,
          unRead: unReadChats.length,
        );
      } else {
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


  Future<RoomModel> createRoom(String friendUid) async {
    final room = roomCollection.doc();
    await room.set(
      RoomModel(
        roomId: room.id,
        members: [uid!, friendUid],
        recentMessage: '',
        recentMessageSender: '',
        recentMessageTime: DateTime.now(),
        createdAt: DateTime.now(),
      ).toJson(),
    );

    final doc =
    await FirebaseFirestore.instance.collection('rooms').doc(room.id).get();
    final roomModel = RoomModel.fromSnapshot(doc);
    return roomModel;
  }

  Future<List<ChatModel>> getUnReadChats(String roomId) async {

    final chats = await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('chat')
        .get();

    final unReadList = chats.docs.where((doc) {
      final memb = doc.data()['readMembers'] as List<dynamic>;
      return !memb.contains(FirebaseAuth.instance.currentUser!.uid);
    }).toList();

    final unReadModelList =
    unReadList.map((e) => ChatModel.fromSnapshot(e)).toList();
    return unReadModelList;
  }
}


class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


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
