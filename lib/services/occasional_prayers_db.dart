import 'package:cloud_firestore/cloud_firestore.dart';

class OccasionalPrayer {
  String id ="empty";
  String category = "";
  String source = "";
  String prayer = "";
  String title = "";
  List<String> categories = [];

  OccasionalPrayer({this.id, this.category, this.title, this.prayer, this.source, this.categories});
}

List<String> opCategories = [];

class OccasionalPrayerList {
  List<String> categories;
  List<OccasionalPrayer> prayers;

  OccasionalPrayerList({this.categories, this.prayers});
}

class OccasionalPrayerDB {

  final CollectionReference occasionalPrayerCollection = FirebaseFirestore
      .instance.collection('occasional_prayers');

  Stream<List<OccasionalPrayer>> get occasionalPrayerList {
    Stream<List<OccasionalPrayer>> temp = occasionalPrayerCollection.snapshots().map(_ops);
    return temp;
  }
/*
The ChurchCreationThe NationSpecific to CanadaSpecific to the United States or MexicoSocietyThose in NeedFamily and Personal LifeThroughout the DayPersonal DevotionAt Times of Prayer and WorshipDeath, the Departed & The Communion of SaintsThanksgivings
 */
  // get all the canticles
  List<OccasionalPrayer> _ops(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
        return OccasionalPrayer(
              id: doc.id
            , category: doc.data()['category'] ?? ""
            , title: doc.data()['title'] ?? ""
            , prayer: doc.data()['prayer'] ?? ""
            , source: doc.data()['source'] ?? ""
        );
    }).toList();
  }
}