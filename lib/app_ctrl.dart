import 'dart:io';
import 'dart:ui';

import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/commons/enums/enums.dart';
import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCtrl extends GetxController {
  static AppCtrl get find => Get.find<AppCtrl>();
  LanguageType currentLanguage = LanguageType.ENGLISH;
  LanguageTypeHelper helper = LanguageTypeHelper();

  bool isLogin = false;
  List<LanguageType> languages = [
    LanguageType.ENGLISH,
    LanguageType.JAPAN,
    LanguageType.KOREA,
    LanguageType.VIETNAM,
  ];

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
          currentLanguage = helper.languageType(value);
        } else {
          var currentLanguagePhone = Platform.localeName;
          if (currentLanguagePhone.isNotEmpty) {
            if (['en', 'ja', 'ko', 'vi'].contains(currentLanguagePhone)) {
              setLocate(currentLanguagePhone);
            }
          } else {
            currentLanguage = LanguageType.ENGLISH;
            Get.updateLocale(const Locale(AppConstants.languageEn));
            update();
          }
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

    var currentLocate = Locale(languageCode, countryCode ?? '');
    currentLanguage = helper.languageType(languageCode);
    Get.updateLocale(currentLocate);
    update();
    await SharedPreference.setLanguage(languageCode);
    update();
  }
}
