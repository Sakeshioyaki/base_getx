import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/commons/enums/enums.dart';
import 'package:base_getx/generated/l10n.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
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
        child: GetBuilder<AppCtrl>(builder: (logic) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton<LanguageType>(
                    items: listItem,
                    value: logic.currentLanguage,
                    onChanged: (selectValue) {
                      String languageCode = helper
                          .languageCode(selectValue ?? LanguageType.ENGLISH);
                      if (Get.locale?.languageCode != languageCode) {
                        appCtrl.updateLanguage(
                            selectValue ?? LanguageType.ENGLISH);
                      }
                    },
                  ),
                ),
                Text(
                  Dictionary.create_account,
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
