import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/flavor.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:base_getx/views/mobile/app_mobile.dart';
import 'package:base_getx/firebase_options.dart';
import 'package:base_getx/utils/logger.dart';
import 'package:base_getx/views/web_desktop/app_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';

Future initService() async {
  await Get.putAsync(() => FirebaseServices().init());
  Get.put<AppCtrl>(AppCtrl());
}

 class Solution {
  static String largestGoodInteger(String num) {
    int current = -1;
    for (int i = 0; i < num.length - 2;) {
      if (num[i] == num[i + 1]) {
        if (num[i] == num[i + 2]) {
          if (current < int.parse(num[i])) {
            current = int.parse(num[i]);
          }
          i = i + 3;
        } else {
          i = i + 2;
        }
      } else {
        i = i + 1;
      }
    }
    if (current >= 0) return "${current}${current}${current}";
    return "";
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.DEVELOPMENT;
  print('>>>> ${Solution.largestGoodInteger("1221000")}');
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await initService();
    if (Platform.isAndroid || Platform.isIOS) {
      runApp(const AppMobile());
    } else {
      runApp(const AppWeb());
    }
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  } catch (e) {
    logger.e(e);
  }
}
