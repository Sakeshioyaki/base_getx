import 'package:base_getx/views/mobile/login/login_vm.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  final String? tag;

  SearchBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(LoginVm(), tag: tag ?? this.tag);
  }

}