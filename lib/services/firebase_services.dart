import 'package:base_getx/database/shared_preference.dart';
import 'package:base_getx/modals/user_model.dart';
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

  UserModel? checkLogin() {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      UserModel user = UserModel(
        userName: currentUser.displayName,
        userId: currentUser.uid,
        email: currentUser.email,
      );
      return user;
    }
    return null;
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
        await userCredential.user?.updateDisplayName(userName);
        _firestore
            .collection("users")
            .doc(userCredential.user!.uid.toString())
            .set(user.toJson());
        return user;
      }
    } on FirebaseException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return null;
  }

  Future<UserModel?> loginByEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        UserModel user = UserModel(
          userId: userCredential.user!.uid.toString(),
          email: userCredential.user!.email.toString(),
        );

        SharedPreference.setUser(user);
        return user;
      }
    } on FirebaseException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return null;
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }
}
