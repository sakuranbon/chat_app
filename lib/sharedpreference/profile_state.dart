import 'dart:io';

import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.freezed.dart';

final profileStateProvider =
StateNotifierProvider<ProfileStateNotifier, ProfileState>(
      (ref) => ProfileStateNotifier(),
);

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default('') String userName,
    @Default(null) File? imageFile,
  }) = _ProfileState;
}

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  ProfileStateNotifier() : super(const ProfileState()) {
    getUser();
  }

  String imgURL =
      'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80';

  final picker = ImagePicker();

  Future<void> getUser() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final user = UserModel.fromSnapshot(doc);
    print(user.name);
    state = state.copyWith(userName: user.name);
  }


  Future<void> openImagePicker() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      maxWidth: 600,
    );


    if (pickedFile == null) {
      return;
    }


    state = state.copyWith(imageFile: File(pickedFile.path));
  }


  Future updateUser() async {
    state = state.copyWith(isLoading: true);


    if (state.imageFile != null && state.userName.isNotEmpty) {

      final ref = FirebaseStorage.instance
          .ref()
          .child('profileimages')
          .child('${state.userName}.jpg');
      await ref.putFile(state.imageFile!);
      imgURL = await ref.getDownloadURL();


      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'profilePic': imgURL,
        'name': state.userName,
      });
      state = state.copyWith(isLoading: false);
    } else if (state.imageFile != null) {



      final ref = FirebaseStorage.instance
          .ref()
          .child('profileimages')
          .child('${state.userName}.jpg');
      await ref.putFile(state.imageFile!);
      imgURL = await ref.getDownloadURL();


      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'profilePic': imgURL,
      });
      state = state.copyWith(isLoading: false);
    } else if (state.userName.isNotEmpty) {



      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': state.userName,
      });
      state = state.copyWith(isLoading: false);
    } else {
      state = state.copyWith(isLoading: false);
      return null;
    }
  }

  void changeUserName(String name) {
    state = state.copyWith(userName: name);
  }
}
