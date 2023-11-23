import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/enums/load_status.dart';
import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:base_getx/views/mobile/language/language_page.dart';
import 'package:base_getx/views/mobile/login/login_page.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashVm extends GetxController {
  AppCtrl appCtrl = Get.find();

  LoadStatus onLoad = LoadStatus.initial;
  bool isFirst = false;

  void init() async {
    onLoad = LoadStatus.loading;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
    navigator();
  }

  void navigator() async {
    await appCtrl.checkLogin();
    var firstLogin = await SharedPreference.getFirstLogin();
    onLoad = LoadStatus.success;
    if (firstLogin == true) {
      isFirst = false;
    } else {
      isFirst = true;
    }
    update();
    Future.delayed(const Duration(milliseconds: 3000), () {
      _navigatorTo();
    });
  }

  void _navigatorTo() {
    if (isFirst) {
      // Get.offAll(
      //   () => const LanguagePage(
      //     isSplash: true,
      //   ),
      //   transition: Transition.rightToLeftWithFade,
      // );
      Get.offAll(
        () => const SignUpPage(),
        transition: Transition.rightToLeftWithFade,
      );
    } else {
      if (appCtrl.isLogin) {
        Get.offAll(
          () => const HomePage(),
          transition: Transition.rightToLeftWithFade,
        );
      } else {
        // Get.offAll(
        //   () => const LoginPage(),
        //   transition: Transition.rightToLeftWithFade,
        // );
        Get.offAll(
              () => const SignUpPage(),
          transition: Transition.rightToLeftWithFade,
        );
      }
    }
  }
}
