import 'package:cloud_firestore/cloud_firestore.dart';

class CanticleModel {
  String id;
  String name;
  String notes;
  String number;
  String reference;
  String text;
  String title;

  CanticleModel({this.id, this.name, this.notes, this.number, this.reference, this.text, this.title});

  CanticleModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    id = snapshot.id;
    name = snapshot.data()["name"];
    notes = snapshot.data()["notes"];
    number = snapshot.data()["number"];
    reference = snapshot.data()["reference"];
    title = snapshot.data()["title"];
    text = snapshot.data()["text"];
  }
}
