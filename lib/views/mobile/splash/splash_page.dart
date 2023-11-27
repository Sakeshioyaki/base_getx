import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/views/mobile/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final String? tag;

  const SplashPage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo_app),
      ),
    );
  }
}
