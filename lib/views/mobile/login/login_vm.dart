import 'package:base_getx/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVm extends GetxController{
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  void loginByEmail(){
    FirebaseServices firebaseServices = Get.find();
    // firebaseServices.l
  }
}