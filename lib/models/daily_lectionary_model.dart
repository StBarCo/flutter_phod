import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/models/reading_model.dart';

class DailyLectionaryModel {
  String id;
  String title;
  List<ReadingModel> mp1;
  List<ReadingModel> mp2;
  List<ReadingModel> mpp;
  List<ReadingModel> ep1;
  List<ReadingModel> ep2;
  List<ReadingModel> epp;

  DailyLectionaryModel(
      { this.id
        , this.title
        , this.mp1
        , this.mp2
        , this.mpp
        , this.ep1
        , this.ep2
        , this.epp
      });

  List<ReadingModel> readingModel(s) {
    switch(s) {
      case 'mp1': return mp1;
      case 'mp2': return mp2;
      case 'mpp': return mpp;
      case 'ep1': return ep1;
      case 'ep2': return ep2;
      case 'epp': return epp;
    }
  }
  DailyLectionaryModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.data()["title"];
    mp2 = ReadingModel().mapReadingModel(snapshot.data()["mp2"]);
    mp1 = ReadingModel().mapReadingModel(snapshot.data()["mp1"]);
    mpp = ReadingModel().mapReadingModel(snapshot.data()["mpp"]);
    ep1 = ReadingModel().mapReadingModel(snapshot.data()["ep1"]);
    ep2 = ReadingModel().mapReadingModel(snapshot.data()["ep2"]);
    epp = ReadingModel().mapReadingModel(snapshot.data()["epp"]);
  }

}