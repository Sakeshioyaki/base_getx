import 'dart:io';
import 'dart:ui';

import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCtrl extends GetxController {
  static AppCtrl get find => Get.find<AppCtrl>();
  Locale currentLocate =  Locale( Platform.localeName);
  bool isLogin = false;
  String languageCode = '';

  Future<void> checkLogin() async {
    print('>>> ${Platform.localeName}');
    String? token = await SharedPreference.getToken();
    if ((token != null) && token.isNotEmpty) {
      isLogin = true;
    } else {
      isLogin = false;
    }
    update();
  }

  void appInitData() async {
    try {
      SharedPreference.getLanguage().then((value) {
        if (value != null) {
          setLocate(value);
          languageCode = value;
        } else {
          var currentLanguagePhone = Platform.localeName;
          languageCode = AppConstants.languageJa;
          if (currentLanguagePhone.isNotEmpty) {
            if (['en', 'ja', 'ko', 'vi'].contains(currentLanguagePhone)) {
              languageCode = currentLanguagePhone;
            }
          }
          setLocate(languageCode);
        }
      });
      update();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> setLocate(String code) async {
    final splitLanguageCode = code.split("-");
    String languageCode = code;
    String? countryCode;

    if (splitLanguageCode.length == 2) {
      languageCode = splitLanguageCode.first;
      countryCode = splitLanguageCode.last;
    }

    currentLocate = Locale(languageCode, countryCode ?? '');
    Get.updateLocale(currentLocate);
    languageCode = code;
    await SharedPreference.setLanguage(code);
    update();
  }

}
