import 'package:legereme/controllers/canticleController.dart';
import 'package:legereme/controllers/collectController.dart';
import 'package:legereme/controllers/configController.dart';
import 'package:legereme/controllers/liturgicalCalendarController.dart';
import 'package:legereme/controllers/psalmController.dart';
import 'package:get/get.dart';
import 'package:legereme/controllers/authController.dart';
import 'package:legereme/controllers/lessonController.dart';

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
