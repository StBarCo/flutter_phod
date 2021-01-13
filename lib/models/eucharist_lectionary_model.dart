import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/models/reading_model.dart';

class EucharistLectionaryModel {
  String id;
  String title;
  List<String> colors;
  List<ReadingModel> psalms;
  List<ReadingModel> ot;
  List<ReadingModel> nt;
  List<ReadingModel> gs;

  EucharistLectionaryModel(
      { this.id
      , this.title
      , this.colors
      , this.psalms
      , this.ot
      , this.nt
      , this.gs
      });

  EucharistLectionaryModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.data()["title"];
    psalms = ReadingModel().mapReadingModel(snapshot.data()["ps"]);
    nt = ReadingModel().mapReadingModel(snapshot.data()["nt"]);
    ot = ReadingModel().mapReadingModel(snapshot.data()["ot"]);
    gs = ReadingModel().mapReadingModel(snapshot.data()["gs"]);
  }
}