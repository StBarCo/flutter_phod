import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phod/controllers/userController.dart';
import 'package:flutter_phod/models/user.dart';
import 'package:flutter_phod/services/database.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();

  User get user => _user.value;

  @override
  void onInit() {
    //
    _user.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // create a user document
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
      if (await DatabaseService().createNewUser(_user)) {
        // Get.find<UserController>().user = _user;
        Get.find<UserController>().set( _user );
        Get.back();
      }
    }
    catch(e) {
      Get.snackbar(
          "Error creating user",
          e.message,
          snackPosition: SnackPosition.BOTTOM
      );

    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e) {
      Get.snackbar(
          "Error signing in",
          e.message,
          snackPosition: SnackPosition.BOTTOM
      );

    }

  }

  void signOut() async {
    try {
      await _auth.signOut();
    }
    catch(e) {
      Get.snackbar(
          "Error signing out",
          e.message,
          snackPosition: SnackPosition.BOTTOM
      );
    }

  }
}