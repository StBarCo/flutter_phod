import 'package:get/get.dart';
import 'package:flutter_phod/models/lesson_model.dart';

class LessonController extends GetxController {
  final lesson1 = LessonModel().obs;
  final lesson2 = LessonModel().obs;
  final lesson3 = LessonModel().obs;
  final random = LessonModel().obs; // single use, random scripture

  LessonModel getLesson(i) {
    switch(i.toString()) {
      case 'gs':
      case '3': return lesson3.value; break;
      case 'nt':
      case '2': return lesson2.value; break;
      case 'ot':
      case '1': return lesson1.value; break;
      default: return random.value; break;
    }
  }

  LessonModel setLesson( LessonModel lesson, i) {
    switch(i.toString()) {
      case 'gs':
      case '3': lesson3.value = lesson; return lesson3.value; break;
      case 'nt':
      case '2': lesson2.value = lesson; return lesson2.value; break;
      case 'ot':
      case '1': lesson1.value = lesson; return lesson1.value; break;
      default: random.value = lesson; return random.value; break;
    }
  }

  @override
  void onInit() {
    lesson1.value = LessonModel();
    lesson2.value = LessonModel();
    lesson3.value = LessonModel();
    random.value = LessonModel();
  }
}
