import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_dialog.dart';
import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/modals/user_model.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:base_getx/views/mobile/home/home_binding.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpVm extends GetxController {
  AppCtrl appCtrl = Get.find();
  Color selectColor = Colors.red;
  FirebaseServices firebaseServices = Get.find();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();

  Future<void> singInByEmail() async {
    UserModel? user = await firebaseServices.signUpByEmail(
      email: emailCtrl.text,
      password: passCtrl.text,
      userName: userNameCtrl.text,
    );

    if (user != null) {
      AppDialog.messages(
        message: 'Account registration successful',
        onTapOk: () {
          Get.offAll(
            () => const HomePage(),
            transition: Transition.rightToLeftWithFade,
            binding: HomeBinding(),
          );
        },
      );
      SharedPreference.setUser(user);
      appCtrl.setCurrentUser(user);
    }
  }
}
