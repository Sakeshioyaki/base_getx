import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_colors.dart';
import 'package:base_getx/generated/l10n.dart';
import 'package:base_getx/views/mobile/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';


class AppWeb extends StatefulWidget {
  const AppWeb({Key? key}) : super(key: key);

  @override
  State<AppWeb> createState() => _AppWebState();
}

class _AppWebState extends State<AppWeb> {
  late AppCtrl appCtrl = Get.find<AppCtrl>();

  @override
  void initState() {
    super.initState();
    appCtrl.appInitData();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  void dispose() {
    appCtrl.dispose();
    super.dispose();
  }

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
          home: const SplashPage(),
          builder: (BuildContext context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Container(
                child: child ?? const SizedBox(),
              ),
            );
          },
          // localizationsDelegates:  const [
          //   S.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: const [
          //   Locale('en', ''), // English
          //   Locale('ja', ''), // Japan
          //   Locale('ko', ''), // Korean
          //   Locale('vi', ''), // Korean
          // ],
          // locale: logic.currentLocate,
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.ltr,
        ),
      );
    });
  }
}
