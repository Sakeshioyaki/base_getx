import 'package:base_getx/views/mobile/language/language_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatefulWidget {
  final bool isSplash;
  const LanguagePage({super.key,  required this.isSplash});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  LanguageVm vm = Get.put<LanguageVm>(LanguageVm());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: (){
          // vm.languageSelected();
        }, child: Text('abc langguage page'),
      ),
    );
  }
}
