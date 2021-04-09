import 'package:get/get.dart';
import 'package:legereme/models/lesson_model.dart';

class LessonController extends GetxController {
  final lesson1 = LessonModel().obs;
  final lesson2 = LessonModel().obs;
  final lesson3 = LessonModel().obs;
  final lesson4 = LessonModel().obs;
  final random = LessonModel(ref: "empty"); // single use, random scripture

  void reset() {
    lesson1.value = LessonModel(ref: 'empty');
    lesson2.value = LessonModel(ref: 'empty');
    lesson3.value = LessonModel(ref: 'empty');
    lesson4.value = LessonModel(ref: 'empty');
  }
  LessonModel getLesson(i) {
    switch(i.toString()) {
      case '4':
      case 'entryGospel': // Palm Sunday only
        return (lesson1.value == null) ? LessonModel() : lesson4.value; break;
      case 'gs':
      case '3':
        return (lesson1.value == null) ? LessonModel() : lesson3.value; break;
      case 'nt':
      case '2':
        return (lesson1.value == null) ? LessonModel() : lesson2.value; break;
      case 'ot':
      case '1':
        return (lesson1.value == null) ? LessonModel() : lesson1.value; break;
      default: return LessonModel(); break;
    }
  }

  LessonModel setLesson( LessonModel lesson, i) {
    switch(i.toString()) {
      case '4':
      case 'entryGospel': // Palm Sunday
        lesson4.value = lesson; return lesson4.value; break;
      case 'gs':
      case '3':
        lesson3.value = lesson; return lesson3.value; break;
      case 'nt':
      case '2':
        lesson2.value = lesson; return lesson2.value; break;
      case 'ot':
      case '1':
        lesson1.value = lesson; return lesson1.value; break;
      default: random; break;
    }
  }

  @override
  void onInit() {
    lesson1.value = LessonModel(ref: "empty");
    lesson2.value = LessonModel(ref: "empty");
    lesson3.value = LessonModel(ref: "empty");
  }
}
