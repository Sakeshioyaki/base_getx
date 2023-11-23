import 'package:base_getx/views/mobile/language/language_vm.dart';
import 'package:get/get.dart';

class LanguageBinding extends Bindings {
  final String? tag;

  LanguageBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(LanguageVm(), tag: tag ?? this.tag);
  }
}
