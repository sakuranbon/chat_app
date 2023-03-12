import 'package:chat_app/constant.dart';
import 'package:chat_app/sign_up.dart';
import 'package:chat_app/state/login_state.dart';
import 'package:chat_app/talk_room.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInPage extends ConsumerWidget {
  LogInPage({super.key});

  final formKey = GlobalKey<FormState>();
  double deviceHeight = 0;
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
  TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginStateProvider.notifier);

    ref.listen<LoginState>(
      loginStateProvider,
          (previous, state) {
        if (state.navigateChatRoomPage) {
          notifier.resetParameta();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoomPage()));
        }
        if (state.navigateChatRoomPage) {
          notifier.resetParameta();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoomPage()));
        }
      },
    );

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        deviceHeight = MediaQuery.of(context).size.height;
        final notifier = ref.watch(loginStateProvider.notifier);
        final state = ref.watch(loginStateProvider);
        return state.isLoading
            ? Container(color: Constant.whiteColor)
            : GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(
              FocusNode(),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                    EdgeInsets.fromLTRB(30, deviceHeight / 4.8, 30, 0),
                    child: Column(
                      children: [
                        const Text(
                          'Chat App',
                          style: TextStyle(
                            color: Constant.blackColor,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailEditingController,
                                decoration: const InputDecoration(
                                  labelText: "メールアドレス",
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Constant.blackColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constant.greyColor,
                                        width: 2),
                                  ),
                                ),

                                // check tha validation
                                validator: (val) {
                                  return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                      ? null
                                      : "有効なメールアドレスを入力してください";
                                },
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: passwordEditingController,
                                obscureText: state.passwordInVisible,
                                decoration: InputDecoration(
                                  labelText: "パスワード",
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Constant.blackColor,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      notifier.toggleVisible();
                                    },
                                    icon: Icon(state.passwordInVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constant.greyColor,
                                        width: 2),
                                  ),
                                ),
                                validator: (val) {
                                  if (val!.length < 6) {
                                    return "パスワードは６文字以上です";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Constant.primaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                  ),
                                  child: const Text(
                                    'ログイン',
                                    style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    notifier.login(
                                      context,
                                      formKey,
                                      emailEditingController.text,
                                      passwordEditingController.text,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              Column(
                                children: [
                                  const Text(
                                    'アカウントをお持ちではありませんか？',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text.rich(TextSpan(
                                    text: 'アカウント作成はこちらから',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp()));
                                      },
                                  )),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
