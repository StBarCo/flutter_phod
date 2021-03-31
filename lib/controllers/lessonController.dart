import 'package:get/get.dart';
import 'package:flutter_phod/models/lesson_model.dart';
import 'package:flutter_phod/services/scripture_db.dart';

class LessonController extends GetxController {
  final lesson1 = LessonModel().obs;
  final lesson2 = LessonModel().obs;
  final lesson3 = LessonModel().obs;
  final lesson4 = LessonModel().obs;
  final random = LessonModel().obs; // single use, random scripture

  LessonModel getLesson(i) {
    switch(i.toString()) {
      case '4':
      case 'entryGospel': // Palm Sunday only
        if (lesson4.value.ref == null) ScriptureDB().getLessons();
        return lesson4.value; break;
      case 'gs':
      case '3':
        if ( lesson3.value.ref == null) ScriptureDB().getLessons();
        return lesson3.value; break;
      case 'nt':
      case '2': if ( lesson2.value.ref == null ) ScriptureDB().getLessons();
        return lesson2.value; break;
      case 'ot':
      case '1':
        if ( lesson1.value.ref == null ) ScriptureDB().getLessons();
        return lesson1.value; break;
      default: return random.value; break;
    }
  }

  LessonModel setLesson( LessonModel lesson, i) {
    switch(i.toString()) {
      case '4':
      case 'entryGospel': // Palm Sunday
        lesson4.value = lesson; return lesson4.value; break;
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
