import 'package:base_getx/generated/l10n.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/views/mobile/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(
              Dictionary.restore_done,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(
                  () => SignUpPage(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 200),
                );
              },
              child: const Text('Go to sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
