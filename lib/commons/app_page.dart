import 'package:base_getx/commons/enums/app_routes.dart';
import 'package:base_getx/views/mobile/home/home_binding.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_binding.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_page.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:base_getx/views/mobile/splash/splash_binding.dart';
import 'package:base_getx/views/mobile/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static List<GetPage> routes({String? tag}) => <GetPage>[
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(tag: tag),
      binding: SplashBinding(tag: tag),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(tag: tag),
      binding: HomeBinding(tag: tag),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(tag: tag),
      binding: SignUpBinding(tag: tag),
    ),
  ];
}
