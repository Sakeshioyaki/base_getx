import 'package:base_getx/modals/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVm extends GetxController with GetSingleTickerProviderStateMixin {
  var count = 0;
  late final TabController tabController;
  final TextEditingController searchTextController = TextEditingController();
  List<NoteModel> resultSearch =[];
  int indexTab = 0;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    tabController.addListener(() {
      print('index- ${tabController.index}');
      indexTab = tabController.index;
      update();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void search(){

  }

  void increment() {
    count++;
    update();
  }
}
