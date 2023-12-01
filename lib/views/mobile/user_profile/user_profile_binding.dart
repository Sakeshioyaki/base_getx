import 'package:base_getx/views/mobile/user_profile/user_profile_vm.dart';
import 'package:get/get.dart';

class UserProfileBinding extends Bindings{
  final String? tag;

  UserProfileBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(UserProfileVm(), tag: tag ?? this.tag);
  }

}