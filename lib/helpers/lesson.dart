import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:flutter_phod/services/scripture_db.dart';
import 'package:flutter_html/flutter_html.dart';


class Lesson extends StatefulWidget {
  int lesson;
  LiturgicalDay litDay;
  Lesson({Key key, this.lesson, this.litDay}) : super(key: key);
  @override
  _LessonState createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  Future futureLesson;
  @override
  void  initState() {
    super.initState();
    futureLesson = _getESV();
  }

  _getESV() async {
    return await ScriptureDB().getDailyESV(widget.litDay, widget.lesson);
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ScriptureDB().getDailyESV(widget.litDay, widget.lesson),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ShowLesson(lesson: snapshot.data);
          }
          else if (snapshot.hasError) {
            return Text('Error getting lesson: ${snapshot.error}');
          };
          return Container();
        }
    );
  }
}

class ShowScripture extends StatefulWidget {
  String ref;
  ShowScripture({Key key, this.ref}) : super(key: key);
  @override
  _ShowScriptureState createState() => _ShowScriptureState();
}

class _ShowScriptureState extends State<ShowScripture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ScriptureDB().getFromEsv( widget.ref),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ShowLesson(lesson: snapshot.data);
          }
          else if (snapshot.hasError) {
            return Text('Error getting lesson: ${snapshot.error}');
          };
          return Container();
        }
    );
  }
}


class ShowLesson extends StatelessWidget {
  var lesson;
  ShowLesson({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (lesson == null)
        ? Container()
        : Html(
          data: lesson.passage,
          style: {
            "p": Style(
              fontSize: FontSize(18.0),
            ),
            "mark": Style(
              color: Colors.red[700],
              // Should'ought'a be superscript
              fontSize: FontSize(12.0)
            )
          }
        );
  }
}


