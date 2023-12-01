import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/enums/load_status.dart';
import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/modals/user_model.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:base_getx/views/mobile/home/home_binding.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:base_getx/views/mobile/login/login_binding.dart';
import 'package:base_getx/views/mobile/login/login_page.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future initSignUp() async {
  Get.put<SignUpVm>(SignUpVm());
}

class SplashVm extends GetxController {
  AppCtrl appCtrl = Get.find();
  FirebaseServices firebaseServices = Get.find();
  LoadStatus onLoad = LoadStatus.initial;
  bool isFirst = false;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    onLoad = LoadStatus.loading;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
    navigator();
  }

  // Future<void> checkLogin() async {
  //   ///using token
  //   // String? token = await SharedPreference.getToken();
  //   // if ((token != null) && token.isNotEmpty) {
  //   //   isLogin = true;
  //   // } else {
  //   //   isLogin = false;
  //   // }
  //   ///using firebase
  //   UserModel? user = firebaseServices.checkLogin();
  //   if (user != null) {
  //     appCtrl.setIsLogin(true);
  //     appCtrl.setCurrentUser(user);
  //     return;
  //   }
  //   appCtrl.setIsLogin(false);
  // }

  void navigator() async {
    await appCtrl.checkLogin();
    var firstLogin = await SharedPreference.getFirstLogin();
    onLoad = LoadStatus.success;
    if (firstLogin == true) {
      isFirst = false;
    } else {
      isFirst = true;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      _navigatorTo();
    });
  }

  Future<void> _navigatorTo() async {
    // if (isFirst) {
    //   // Get.offAll(
    //   //   () => const LanguagePage(
    //   //     isSplash: true,
    //   //   ),
    //   //   transition: Transition.rightToLeftWithFade,
    //   // );
    //   Get.offAll(
    //     () => LoginPage(),
    //     transition: Transition.rightToLeftWithFade,
    //     binding: LoginBinding(),
    //   );
    // } else {
      if (appCtrl.isLogin) {
        Get.offAll(
          () => const HomePage(),
          transition: Transition.rightToLeftWithFade,
          binding: HomeBinding(),
        );
      } else {
        // Get.offAll(
        //   () => const LoginPage(),
        //   transition: Transition.rightToLeftWithFade,
        // );
        Get.offAll(
          () => LoginPage(),
          transition: Transition.rightToLeftWithFade,
          binding: LoginBinding(),
        );
      }
    // }
  }
}
