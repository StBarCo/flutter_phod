import 'package:cloud_firestore/cloud_firestore.dart';

class LessonModel {
  String ref = '';
  String passage = '<p>Not Ready</p>'; // html
  String style = 'req';  // req or opt
  String source = ''; // 'ESV' or 'WEB'
  String title = ''; // human readable ref

  LessonModel({this.ref, this.passage, this.style, this.source, this.title});


  LessonModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    ref = snapshot.data()['ref'];
    passage = snapshot.data()["passage"];
    style = snapshot.data()["style"];
    source = snapshot.data()['source'];
    title = snapshot.data()["title"];
  }

}