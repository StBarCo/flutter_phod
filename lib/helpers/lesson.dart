import 'package:flutter/material.dart';
import 'package:flutter_phod/controllers/lessonController.dart';
import 'package:get/get.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_phod/services/scripture_db.dart';
import 'package:flutter_html/flutter_html.dart';

LessonController lc = Get.put(LessonController());

class Lesson extends StatelessWidget {
  int lesson;
  Lesson({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShowLesson(iLesson: lesson);
  }
}

class ShowLesson extends StatelessWidget {
  int iLesson;
  ShowLesson( {Key key, this.iLesson}) : super(key: key);
  // @override
  Widget build(BuildContext context) {
    return Obx( () =>  Html(
          data: (lc.getLesson(iLesson).passage == null) ? "<p>Not Ready</p>" : lc.getLesson(iLesson).passage,
          style: {
            "p": Style(
              fontSize: FontSize(18.0),
            ),
            "div": Style(
              fontSize: FontSize(18.0),
              color: Colors.blue[900],
            ),
            "mark": Style(
              color: Colors.red[700],
              // Should'ought'a be superscript
              // fontSize: FontSize(12.0)
            )
          }
        )
    );
  }
}

class ShowScripture extends StatelessWidget {
  ShowScripture( String ref);
  String ref;
  @override
  Widget build(BuildContext context) {
    ScriptureDB().getRandomScripture(ref);
    // will need to ShowLesson
    return ShowLesson();
  }
}



