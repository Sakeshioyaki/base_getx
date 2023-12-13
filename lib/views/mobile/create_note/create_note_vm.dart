import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNoteVm extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  bool isShowSave = false;

  void setShowButtonSave(bool value) {
    isShowSave = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }
}
