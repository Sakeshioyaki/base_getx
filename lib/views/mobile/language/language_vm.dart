import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/utils/logger.dart';
import 'package:base_getx/views/mobile/home/home_binding.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:base_getx/views/mobile/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageVm extends GetxController {
  AppCtrl appCtrl = Get.find();
  Locale? currentLocale;

  void init() {
    // final curr = languages.firstWhere((e) {
    //   final languageCode = _helper.languageCode(e);
    //   return languageCode == _helper.languageCode(appCtrl.currentLanguage);
    // });
    // currentLanguage = curr;
    // languageSelected = curr;
    update();
  }
  //
  // void onChangeLanguage(int index) {
  //   languageSelected = languages.elementAt(index);
  //   update();
  // }
  //
  // void saveChangeLanguage(bool isSplash) async {
  //   if (languageSelected == null) {
  //     return;
  //   }
  //   try {
  //     final languageCode = _helper.languageCode(languageSelected!);
  //     AppCtrl appCtrl = Get.find();
  //     await appCtrl.setLocate(languageCode);
  //     try {
  //       if (!isSplash) {
  //       } else {
  //         Get.offAll(
  //           () => const HomePage(),
  //           transition: Transition.rightToLeftWithFade,
  //           binding: HomeBinding()
  //         );
  //       }
  //     } catch (e) {
  //       logger.e("HomeVm not found");
  //       e.printError();
  //     }
  //     currentLanguage = languageSelected;
  //   } catch (e) {
  //     debugPrint("saveChangeLanguage on setting error $e");
  //   }
  // }
}
