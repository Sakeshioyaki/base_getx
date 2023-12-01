import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/views/mobile/user_profile/user_profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UserProfilePage extends StatelessWidget {
  final String? tag;
  const UserProfilePage({
    super.key,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileVm>(
      builder: (logic) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: Get.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.58, -0.81),
                    end: Alignment(-0.58, 0.81),
                    colors: [
                      Color(0xAFD1CCF4),
                      Color(0xFFE6CECE),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          // width: 400,
                          height: 230,
                          child: Lottie.network(
                            'https://lottie.host/d04a6b4e-50f6-4cca-b69f-a1c2a7a56502/5LlulHbKMy.json',
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.center,
                          )),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(62))),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          AppImages.logo_app,
                          width: 80,
                          height: 80,
                        ),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      logic.logOut();
                    },
                    child: const Text('Log out'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
