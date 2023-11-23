import 'package:base_getx/views/mobile/login/login_vm.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  final String? tag;

  LoginBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(LoginVm(), tag: tag ?? this.tag);
  }

}