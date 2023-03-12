import 'package:chat_app/constant.dart';
import 'package:chat_app/provider.dart';
import 'package:chat_app/sharedpreference/sharedpreference.dart';
import 'package:chat_app/sharedpreference/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountSetting extends ConsumerWidget {
  AccountSetting({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileStateProvider.notifier);
    final state = ref.watch(profileStateProvider);
    final asyncValue = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'アカウント設定',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
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
      body: SafeArea(
        child: state.isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        )
            : GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          child: asyncValue.when(
            loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                )),
            error: (err, stack) => Text('Error:$err'),
            data: (data) {
              String originalImgURL =
              data.get('profilePic') as String != ''
                  ? data.get('profilePic') as String
                  : Constant.anonymousProfilePic;
              controller.text = state.userName;
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 150,
                                    child: CircleAvatar(
                                      radius: 120,
                                      backgroundImage: state.imageFile ==
                                          null
                                          ? NetworkImage(originalImgURL)
                                      as ImageProvider
                                          : FileImage(state.imageFile!),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -5.0,
                                    right: -5.0,
                                    child: RawMaterialButton(
                                      fillColor: Constant.primaryColor,
                                      onPressed: () async {
                                        await notifier.openImagePicker();
                                      },
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: "名前",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constant.greyColor, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Constant.primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              notifier.changeUserName(controller.text);
                              notifier.updateUser();
                              SharedPreferencesData().getUserNameFromSF();
                            },
                            child: const Text('プロフィールを更新')),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
