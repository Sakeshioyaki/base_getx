import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_colors.dart';
import 'package:base_getx/l10n/localization.dart';
import 'package:base_getx/views/mobile/splash/splash_binding.dart';
import 'package:base_getx/views/mobile/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class AppMobile extends StatelessWidget {
  const AppMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppCtrl>(builder: (logic) {
      return OverlaySupport(
        child: GetMaterialApp(
          // theme: ThemeData.from(colorScheme: AppColors.lightScheme),
          // darkTheme: ThemeData.from(colorScheme: AppColors.darkScheme),
          themeMode: ThemeMode.light,
          opaqueRoute: Get.isOpaqueRouteDefault,
          popGesture: Get.isPopGestureEnable,
          initialBinding: SplashBinding(),
          home: const SplashPage(),
          builder: (BuildContext context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Container(
                child: child ?? const SizedBox(),
              ),
            );
          },
          locale: logic.currentLocale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.ltr,
        ),
      );
    });
  }
}
