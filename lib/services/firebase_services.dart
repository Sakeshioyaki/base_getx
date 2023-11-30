import 'package:base_getx/commons/app_dialog.dart';
import 'package:base_getx/modals/user_model.dart';
import 'package:base_getx/views/mobile/home/home_binding.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseServices extends GetxService {
  static FirebaseServices get find => Get.find();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirebaseServices> init() async {
    return this;
  }

  Future<UserModel?> signUpByEmail({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        UserModel user = UserModel(
          userId: userCredential.user!.uid.toString(),
          userName: userName,
          email: userCredential.user!.email.toString(),
        );
        _firestore
            .collection("users")
            .doc(userCredential.user!.uid.toString())
            .set(user.toJson());
        return user;
      }
      return null;
    } on FirebaseException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}
