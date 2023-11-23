import 'package:base_getx/views/mobile/splash/splash_vm.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  final String? tag;

  SplashBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(SplashVm(), tag: tag ?? this.tag);
  }
}
