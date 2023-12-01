import 'package:base_getx/views/mobile/user_profile/user_profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          body: TextButton(
            onPressed: () {
              logic.logOut();
            },
            child: const Text('Log out'),
          ),
        );
      },
    );
  }
}
