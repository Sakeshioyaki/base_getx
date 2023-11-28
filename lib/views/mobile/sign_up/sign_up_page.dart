import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/generated/l10n.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/l10n/localization.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpVm> {
  final String? tag;

  const SignUpPage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    AppCtrl appCtrl = Get.find<AppCtrl>();
    List<DropdownMenuItem<Locale>> listItem = [];
    LocalizationService.langs.forEach((key, value) {
      listItem.add(
        DropdownMenuItem(
          value: LocalizationService.getLocaleLanguage(key),
          child: Text(value),
        ),
      );
    });
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AppCtrl>(builder: (logic) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton<Locale>(
                    items: listItem,
                    value: logic.currentLocale,
                    onChanged: (selectValue) {
                      if (logic.currentLocale != selectValue) {
                        appCtrl.setLocate(
                            selectValue ?? LocalizationService.locales[0]);
                      }
                    },
                  ),
                ),
                Text(
                  Dictionary.create_account.tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: AppConstants.fontInter,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3.0,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
