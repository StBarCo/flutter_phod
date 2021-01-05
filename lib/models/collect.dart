import 'package:cloud_firestore/cloud_firestore.dart';

class CollectModel {
  String id;
  String preface;
  List<String> text; // sometimes there's more than one version
  String title;

  CollectModel({this.id, this.preface, this.text, this.title});

  CollectModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
      id = snapshot.id;
      preface = snapshot.data()["preface"];
      text = snapshot.data()["text"].cast<String>();
      title = snapshot.data()["title"];
  }
}