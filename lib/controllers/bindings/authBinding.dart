import 'package:flutter_phod/controllers/liturgicalCalendarController.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<LiturgicalCalendarController>(LiturgicalCalendarController(), permanent: true);
  }
}
