import 'package:get/get.dart';
import 'package:legereme/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel().obs;
  UserModel get user => _user.value;
  set( UserModel value ) => _user.value = value;
  void clear() {
    _user.value = UserModel();
  }
}
