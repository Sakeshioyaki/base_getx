import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_colors.dart';
import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/views/mobile/home/home_vm.dart';
import 'package:base_getx/views/mobile/user_profile/user_profile_binding.dart';
import 'package:base_getx/views/mobile/user_profile/user_profile_page.dart';
import 'package:base_getx/views/mobile/user_profile/user_profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final String? tag;

  const HomePage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVm>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: GetBuilder<AppCtrl>(builder: (appCtrl) {
            return Text(
              'Welcome, ${appCtrl.currentUser?.userName}',
              style: const TextStyle(color: AppColors.mainColorOrange),
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                Get.to(
                  () => const UserProfilePage(),
                  transition: Transition.rightToLeftWithFade,
                  binding: UserProfileBinding(),
                );
              },
              child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
          bottom: TabBar(
            controller: logic.tabController,
            tabs: [
              Tab(
                icon: Image.asset(
                  AppImages.ic_note_active,
                  width: 20,
                ),
              ),
              Tab(
                icon: Image.asset(
                  AppImages.ic_todo_active,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: logic.tabController,
          children: const [
            Text('djfsajfsklaf'),
            Text('kokoko'),
          ],
        ),
      );
    });
  }
}
