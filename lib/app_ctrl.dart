import 'dart:io';
import 'dart:ui';

import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/l10n/localization.dart';
import 'package:base_getx/modals/user_model.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:base_getx/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCtrl extends GetxController {
  static AppCtrl get find => Get.find<AppCtrl>();
  bool isLogin = false;
  //  'en_US', 'vi_VN', 'ja_jp', 'ko_KR',
  Locale currentLocale = LocalizationService.locales[0];
  UserModel? currentUser;

  Future<void> checkLogin() async {
    ///using token
    // String? token = await SharedPreference.getToken();
    // if ((token != null) && token.isNotEmpty) {
    //   isLogin = true;
    // } else {
    //   isLogin = false;
    // }
    ///using firebase
    final currentUser1 = FirebaseAuth.instance.currentUser;
    if (currentUser1 != null) {
      UserModel user = UserModel(
        userName: currentUser1.displayName,
        userId: currentUser1.uid,
        email: currentUser1.email,
      );
      isLogin = true;
      currentUser = user;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        update();
      });
      return;
    }
    isLogin = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void appInitData() async {
    try {
      SharedPreference.getLanguage().then((value) async {
        if (value != null) {
          setLocate(LocalizationService.getLocaleLanguage(value));
        } else {
          var currentLanguagePhone = Get.deviceLocale;
          if (currentLanguagePhone != null) {
            if (LocalizationService.locales.contains(currentLanguagePhone)) {
              setLocate(currentLanguagePhone);
            }
          } else {
            currentLocale = LocalizationService.fallbackLocale;
            setLocate(LocalizationService.fallbackLocale);
          }
        }
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> setLocate(Locale locale) async {
    currentLocale = locale;
    Get.updateLocale(locale);
    //just using language code Ex: en_US -> en
    await SharedPreference.setLanguage(locale.languageCode);
    update();
  }

  void setCurrentUser(UserModel user) {
    currentUser = user;
    update();
  }

  // void setIsLogin(bool value) {
  //   isLogin = value;
  //   update();
  // }

  void clearUser() {
    currentUser = null;
    isLogin = false;
    update();
  }
}
