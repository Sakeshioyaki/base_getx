import 'package:base_getx/views/mobile/home/home_vm.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  final String? tag;

  HomeBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(HomeVm(), tag: tag ?? this.tag);
  }
}
