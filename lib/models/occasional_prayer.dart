import 'package:cloud_firestore/cloud_firestore.dart';

class OccasionalPrayerModel {
  String id;
  String category;
  String prayer;
  String source;
  String title;

  OccasionalPrayerModel({this.id, this.category, this.prayer, this.source, this.title});

  OccasionalPrayerModel.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    id = snapshot.id;
    category = snapshot.data()["category"];
    prayer = snapshot.data()["prayer"];
    source = snapshot.data()["source"];
    title = snapshot.data()["title"];
  }
}
