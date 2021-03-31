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
  List<ReadingModel> entryGospel;

  EucharistLectionaryModel(
      { this.id
      , this.title
      , this.colors
      , this.psalms
      , this.ot
      , this.nt
      , this.gs
      , this.entryGospel
      });

  EucharistLectionaryModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    // var x = snapshot.data().
    id = snapshot.id;
    title = dataWithDefault(snapshot, "title", "");
    psalms = readingModelWithDefault(snapshot, 'ps');
    nt = readingModelWithDefault(snapshot, 'nt');
    ot = readingModelWithDefault(snapshot, 'ot');
    gs = readingModelWithDefault(snapshot, 'gs');
    entryGospel = readingModelWithDefault(snapshot, 'entryGospel');
  }

  dataWithDefault( DocumentSnapshot snapshot, String field, defaultData) =>
    snapshot.data().containsKey(field) ? snapshot.data()[field] : defaultData;

  readingModelWithDefault( DocumentSnapshot snapshot, String field) =>
      snapshot.data().containsKey(field)
          ? ReadingModel().mapReadingModel(snapshot.data()[field])
          : [new ReadingModel()];

}
