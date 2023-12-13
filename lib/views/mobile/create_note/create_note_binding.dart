import 'package:base_getx/views/mobile/create_note/create_note_vm.dart';
import 'package:get/get.dart';

class CreateNoteBinding extends Bindings {
  final String? tag;

  CreateNoteBinding({this.tag});

  @override
  void dependencies({String? tag}) {
    Get.put(CreateNoteVm(), tag: tag ?? this.tag);
  }
}
