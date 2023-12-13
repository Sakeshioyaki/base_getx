import 'package:base_getx/modals/note_model.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVm extends GetxController with GetSingleTickerProviderStateMixin {
  FirebaseServices firebaseServices = Get.find();

  late final TabController tabController;
  final TextEditingController searchTextController = TextEditingController();
  int indexTab = 0;
  List<NoteModel> listNotes = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    // tabController.addListener(() {
    //   indexTab = tabController.index;
    //   update();
    // });
    listNotes = await firebaseServices.getListNotes();
    update();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void search() {}
}
