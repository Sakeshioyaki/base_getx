import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVm extends GetxController{
  var count = 0;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment(){
    count++;
    update();
  }


}