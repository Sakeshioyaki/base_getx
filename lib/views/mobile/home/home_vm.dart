import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVm extends GetxController  with GetSingleTickerProviderStateMixin {
  var count = 0;
  late final TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void increment(){
    count++;
    update();
  }


}