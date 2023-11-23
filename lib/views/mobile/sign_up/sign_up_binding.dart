import 'package:base_getx/views/mobile/sign_up/sign_up_vm.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings{
  final String? tag;

  SignUpBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(SignUpVm(), tag: tag ?? this.tag);
  }

}