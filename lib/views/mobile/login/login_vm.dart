import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/modals/user_model.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:base_getx/views/mobile/home/home_binding.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVm extends GetxController {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  AppCtrl appCtrl = Get.find();

  Future<void> loginByEmail() async {
    FirebaseServices firebaseServices = Get.find();
    UserModel? user = await firebaseServices.loginByEmail(
      email: emailCtrl.text,
      password: passCtrl.text,
    );

    if (user != null) {
      appCtrl.setCurrentUser(user);
      Get.offAll(
            () => const HomePage(),
        transition: Transition.rightToLeftWithFade,
        binding: HomeBinding(),
      );
    }
  }
}