import 'package:flutter_phod/controllers/canticleController.dart';
import 'package:flutter_phod/controllers/collectController.dart';
import 'package:flutter_phod/controllers/configController.dart';
import 'package:flutter_phod/controllers/liturgicalCalendarController.dart';
import 'package:flutter_phod/controllers/psalmController.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/controllers/authController.dart';
import 'package:flutter_phod/controllers/lessonController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<LiturgicalCalendarController>(LiturgicalCalendarController(), permanent: true);
    Get.put<CanticleController>(CanticleController(), permanent: true);
    Get.put<CollectController>(CollectController(), permanent: true);
    Get.put<LessonController>(LessonController(), permanent: true);
    Get.put<ConfigController>(ConfigController(), permanent: true);
    Get.put<PsalmController>(PsalmController(), permanent: true);
  }
}
