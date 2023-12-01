import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/services/firebase_services.dart';
import 'package:get/get.dart';

class UserProfileVm extends GetxController {
  AppCtrl appCtrl = Get.find();
  FirebaseServices firebaseServices = Get.find();

  Future<void> logOut() async {
    appCtrl.clearUser();
    firebaseServices.logOut();
  }

}