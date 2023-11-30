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

int howMany(int num, int res) {
  while (num >= 3) {
    print('num: ${num} , res : ${res}');
    int nguyen = num ~/ 3;
    int du = num - 3 * nguyen;
    return howMany(nguyen + du, res + nguyen);
  }
  return res;
}

int minSub(List<int> list, int index, int res) {
  while ((index + 1) < list.length) {
    var kq1 = minSub(list.sublist(index + 1), index + 1, list[0] - res);
    var kq2 = minSub(list.sublist(index + 1), index + 1, list[0] + res);
    if (kq1.abs() > kq2) {
      res = kq2;
      return res;
    } else {
      res = kq1.abs();
      return res;
    }
  }

  return res;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.DEVELOPMENT;

  int ket_qua = 5 + howMany(5, 0);
  int ket_qua_2 = minSub([5, 1, -3, 9, 2], 0);
  print('KQQQ - ${ket_qua_2}');

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
