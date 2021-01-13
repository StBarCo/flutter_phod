import 'package:cloud_firestore/cloud_firestore.dart';

class CollectModel {
  String id = "EMPTY";
  String preface ="";
  List<String> text = [""]; // sometimes there's more than one version
  String title = "";

  CollectModel({this.id, this.preface, this.text, this.title});

  CollectModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
      if(snapshot.data() == null) return;
      id = snapshot.id ?? "EMPTY";
      preface = snapshot.data()["preface"] ?? "";
      text = snapshot.data()["text"].cast<String>() ?? "";
      title = snapshot.data()["title"] ?? "";
  }
}