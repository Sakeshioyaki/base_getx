import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/commons/enums/enums.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpVm> {
  final String? tag;

  const SignUpPage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    AppCtrl appCtrl = Get.find<AppCtrl>();
    LanguageTypeHelper helper = LanguageTypeHelper();
    List<DropdownMenuItem<LanguageType>> listItem = [];
    for (var e in appCtrl.languages) {
      listItem.add(
        DropdownMenuItem(
          value: e,
          child: Text(helper.languageCode(e)),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton<LanguageType>(
              items: listItem,
              value: appCtrl.currentLanguage,
              onChanged: (selectValue) {
                String languageCode =
                    helper.languageCode(selectValue ?? LanguageType.ENGLISH);
                if (Get.locale?.languageCode != languageCode) {
                  Get.updateLocale(Locale(languageCode));
                }
              },
            ),
            const Text(
              'Create Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontFamily: AppConstants.fontInter,
                fontWeight: FontWeight.w800,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
