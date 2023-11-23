import 'dart:io';

import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/firebase_options.dart';
import 'package:base_getx/flavor.dart';
import 'package:base_getx/utils/logger.dart';
import 'package:base_getx/views/mobile/app_mobile.dart';
import 'package:base_getx/views/web_desktop/app_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future initService() async {
  Get.put<AppCtrl>(AppCtrl());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.STAGING;

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
