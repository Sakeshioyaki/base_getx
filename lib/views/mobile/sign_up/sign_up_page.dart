import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_colors.dart';
import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/l10n/localization.dart';
import 'package:base_getx/views/mobile/login/login_binding.dart';
import 'package:base_getx/views/mobile/login/login_page.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:base_getx/widgets/select_language.dart';
import 'package:base_getx/widgets/text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpVm> {
  final String? tag;

  SignUpPage({super.key, this.tag});

  final _formKey = GlobalKey<FormState>();
  final SignUpVm signUpVm = Get.find<SignUpVm>();
  final AppCtrl appCtrl = Get.find<AppCtrl>();

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 24,
                    left: 24,
                    top: 10,
                    bottom: 40,
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SelectLanguage(),
                        const SizedBox(height: 50),
                        buildLoginText(),
                        const SizedBox(height: 10),
                        Image.asset(
                          AppImages.logo_app,
                          width: Get.width * 0.5,
                        ),
                        const SizedBox(height: 10),
                        buildLoginByGoogleFacebook(),
                        const SizedBox(height: 30),
                        buildOr(),
                        const SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              buildFieldEmail(),
                              const SizedBox(height: 20),
                              buildFieldUserName(),
                              const SizedBox(height: 20),
                              buildFieldPassword(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTextNoAccount(),
                        const SizedBox(height: 50),
                        buildButtonSignIn()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ShaderMask buildLoginText() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 1.0,
          colors: [
            Color(0x7FFF6348),
            Color(0x7F5352ED),
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Text(
        Dictionary.create_account.tr,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontFamily: AppConstants.fontInter,
          fontWeight: FontWeight.w800,
          letterSpacing: 3.0,
        ),
      ),
    );
  }

  Align buildButtonSignIn() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.lightYellow,
              AppColors.lightViolet,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3E000000),
              blurRadius: 20,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: InkWell(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              await signUpVm.singInByEmail();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Text(
              Dictionary.create_account.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: AppConstants.fontK2D,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOr() {
    return Row(
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
            fontSize: 16,
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
    );
  }

  Widget buildLoginByGoogleFacebook() {
    return Row(
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
          onTap: () {},
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
    );
  }

  Widget buildTextNoAccount() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Don’t You have account,',
              style: TextStyle(
                color: AppColors.greyBoldText,
                fontSize: 14,
                fontFamily: AppConstants.fontInter,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: ' click here.',
              style: const TextStyle(
                color: AppColors.blueTextButton,
                fontSize: 16,
                fontFamily: AppConstants.fontInter,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAll(
                    () => LoginPage(),
                    transition: Transition.rightToLeftWithFade,
                    binding: LoginBinding(),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFieldEmail() {
    return TextFormFieldCommon(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Dictionary.email_require.tr;
        }
        return null;
      },
      controller: signUpVm.emailCtrl,
      hintText: Dictionary.email.tr,
      hintStyle: const TextStyle(
        color: Color(0xC1978F8F),
        fontSize: 14,
        fontFamily: AppConstants.fontInter,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.40,
      ),
      suffixIcon: const Icon(
        Icons.email_outlined,
        color: Color(0xC1978F8F),
        weight: 3,
      ),
    );
  }

  Widget buildFieldUserName() {
    return TextFormFieldCommon(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Dictionary.user_name.tr;
        }
        return null;
      },
      hintText: Dictionary.user_name.tr,
      controller: signUpVm.userNameCtrl,
      hintStyle: const TextStyle(
        color: AppColors.mainTextColor,
        fontSize: 14,
        fontFamily: AppConstants.fontInter,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.40,
      ),
      suffixIcon: const Icon(
        Icons.person,
        color: AppColors.mainTextColor,
        weight: 3,
      ),
    );
  }

  Widget buildFieldPassword() {
    return TextFormFieldCommon(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Dictionary.password_require.tr;
        }
        return null;
      },
      obscureText: true,
      controller: signUpVm.passCtrl,
      hintText: Dictionary.password.tr,
      hintStyle: const TextStyle(
        color: AppColors.mainTextColor,
        fontSize: 14,
        fontFamily: AppConstants.fontInter,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.40,
      ),
      suffixIcon: const Icon(
        Icons.lock,
        color: AppColors.mainTextColor,
        weight: 3,
      ),
    );
  }
}
