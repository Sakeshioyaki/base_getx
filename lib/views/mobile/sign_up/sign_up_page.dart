import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpVm> {
  final String? tag;

  const SignUpPage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.updateColor();
      },
      child: Container(
        height: 100,
        width: 100,
        color: controller.selectColor,
              child: const Text('Anh'),
      ),
    );
  }
}
