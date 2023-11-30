import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/l10n/localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatelessWidget{
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Locale>> listItem = [];
    LocalizationService.langs.forEach((key, value) {
      listItem.add(
        DropdownMenuItem(
          value: LocalizationService.getLocaleLanguage(key),
          child: Text(value),
        ),
      );
    });
    return GetBuilder<AppCtrl>(builder: (logic) {
      return Align(
        alignment: Alignment.centerRight,
        child: DropdownButton<Locale>(
          items: listItem,
          value: logic.currentLocale,
          onChanged: (selectValue) {
            if (logic.currentLocale != selectValue) {
              logic.setLocate(selectValue ?? LocalizationService.locales[0]);
            }
          },
        ),
      );
    });
  }
}
