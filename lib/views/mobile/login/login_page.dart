import 'package:base_getx/commons/app_colors.dart';
import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/views/mobile/login/login_vm.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_binding.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_page.dart';
import 'package:base_getx/widgets/select_language.dart';
import 'package:base_getx/widgets/text_form_feild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginVm loginVm = Get.find();
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.41, -0.91),
                  end: Alignment(0.41, 0.91),
                  colors: [
                    AppColors.lightYellow,
                    AppColors.lightViolet,
                  ],
                ),
              ),
              child: Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    AppImages.logo_app_2,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: SelectLanguage(),
                    ),
                    SizedBox(height: Get.height * 0.1),
                    Text(
                      Dictionary.login.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: AppConstants.fontInter,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 3.0,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0x77FFFFFF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Dictionary.email.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: AppConstants.fontInter,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              buildFieldEmail(),
                              const SizedBox(height: 30),
                              Text(
                                Dictionary.password.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: AppConstants.fontInter,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              buildFieldPassword(),
                              buildForgotPassword(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    buildButtonLogin(),
                    const SizedBox(height: 45),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          color: AppColors.textGrow,
                          fontSize: 14,
                          fontFamily: AppConstants.fontInter,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 125,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppImages.ic_google,
                            width: 24,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 125,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppImages.ic_facebook,
                            width: 24,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    buildTextNoAccount(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align buildButtonLogin() {
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
              loginVm.loginByEmail();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Text(
              Dictionary.login.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: AppConstants.fontK2D,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForgotPassword() {
    return TextButton(
      onPressed: () {
        loginVm.loginByEmail();
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        '${Dictionary.forgot_password.tr} ?',
        style: const TextStyle(
          color: AppColors.colorBlue,
          fontSize: 14,
          fontFamily: AppConstants.fontInter,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget buildFieldEmail() {
    return TextFieldCommon(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Dictionary.email_require.tr;
        }
        return null;
      },
      controller: loginVm.emailCtrl,
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

  Widget buildFieldPassword() {
    return TextFieldCommon(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Dictionary.password_require.tr;
        }
        return null;
      },
      controller: loginVm.passCtrl,
      hintText: Dictionary.password.tr,
      hintStyle: const TextStyle(
        color: Color(0xC1978F8F),
        fontSize: 14,
        fontFamily: AppConstants.fontInter,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.40,
      ),
      suffixIcon: const Icon(
        Icons.lock,
        color: Color(0xC1978F8F),
        weight: 3,
      ),
    );
  }

  Widget buildTextNoAccount() {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Don’t have an account yet? ',
              style: TextStyle(
                color: AppColors.textGrow,
                fontSize: 14,
                fontFamily: AppConstants.fontInter,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            TextSpan(
              text: 'Register for free',
              style: const TextStyle(
                color: AppColors.blueTextButton,
                fontSize: 14,
                fontFamily: AppConstants.fontInter,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAll(
                    () => SignUpPage(),
                    transition: Transition.rightToLeftWithFade,
                    binding: SignUpBinding(),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
