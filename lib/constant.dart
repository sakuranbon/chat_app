import 'package:flutter/material.dart';

class Constant {
  static const primaryColor = Color(0xFFffb341);
  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const greyColor = Color(0xFFc5c5c5);

  static const anonymousProfilePic =
      'https://firebasestorage.googleapis.com/v0/b/pomo-58355.appspot.com/o/profileimages%2F22352899.png?alt=media&token=4ed39c47-1176-47ba-b9d3-479766d7db6b';
}

enum EmailSignResults {
  SignUpCompleted,
  EmailAlreadyPresent,
  SignUpNotCompleted,
}

enum EmailLogInResults {
  LogInCompleted,
  EmailNotVerified,
  EmailPasswordInvalid,
  UnexpectedError,
}
