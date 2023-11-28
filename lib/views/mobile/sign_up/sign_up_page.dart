import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/l10n/localization.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpVm> {
  final String? tag;

  SignUpPage({super.key, this.tag});

  final _formKey = GlobalKey<FormState>();

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<AppCtrl>(builder: (logic) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                const SizedBox(height: 50),
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
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: Get.width * 0.43,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1.70,
                              color: Color(0xC1BCB9B9),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.ic_google,
                                height: 23,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Sign in Google',
                                style: TextStyle(
                                  color: Color(0x7C242424),
                                  fontSize: 14,
                                  fontFamily: AppConstants.fontK2D,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: Get.width * 0.43,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1.70,
                              color: Color(0xC1BCB9B9),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.ic_facebook,
                                height: 23,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Sign in Facebook',
                                style: TextStyle(
                                  color: Color(0x7C242424),
                                  fontSize: 14,
                                  fontFamily: AppConstants.fontK2D,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xC1BCB9B9),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xC1BCB9B9),
                        fontSize: 19,
                        fontFamily: AppConstants.fontInter,
                        fontWeight: FontWeight.w300,
                        height: 0,
                        letterSpacing: 2.03,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 28,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xC1BCB9B9),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Dictionary.email_require.tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: Dictionary.email.tr,
                          hintStyle: const TextStyle(
                            color: Color(0xC1978F8F),
                            fontSize: 14,
                            fontFamily: AppConstants.fontInter,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.40,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFFB6B6B6),
                            ),
                          ),
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xC1978F8F),
                            weight: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
