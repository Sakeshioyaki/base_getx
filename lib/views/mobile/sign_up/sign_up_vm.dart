import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpVm extends GetxController {
  Color selectColor = Colors.red;

  void updateColor() {
    selectColor = selectColor == Colors.red ? Colors.green : Colors.red;
  }
}
