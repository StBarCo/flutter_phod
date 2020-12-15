import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:flutter_phod/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel().obs;
  UserModel get user => _user.value;
  set( UserModel value ) => _user.value = value;
  void clear() {
    _user.value = UserModel();
  }
}
