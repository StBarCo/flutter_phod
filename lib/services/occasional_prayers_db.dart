import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legereme/models/occasional_prayer.dart';

List<String> opCategories = [];

class OccasionalPrayerList {
  List<String> categories;
  List<OccasionalPrayerModel> prayers;

  OccasionalPrayerList({this.categories, this.prayers});
}

class OccasionalPrayerDB {

  final CollectionReference occasionalPrayerCollection = FirebaseFirestore
      .instance.collection('occasional_prayers');

  Stream<List<OccasionalPrayerModel>> get opStream =>
      occasionalPrayerCollection
          .snapshots()
          .map( (QuerySnapshot snapshot) {
            List<OccasionalPrayerModel> ops = List();
            snapshot.docs.forEach((element) {
              ops.add(OccasionalPrayerModel.fromDocumentSnapshot(element));
            });
            return ops;
          });

  Stream<List<OccasionalPrayerModel>> get occasionalPrayerList {
    Stream<List<OccasionalPrayerModel>> temp = occasionalPrayerCollection.snapshots().map(_ops);
    return temp;
  }
/*
The ChurchCreationThe NationSpecific to CanadaSpecific to the United States or MexicoSocietyThose in NeedFamily and Personal LifeThroughout the DayPersonal DevotionAt Times of Prayer and WorshipDeath, the Departed & The Communion of SaintsThanksgivings
 */
  // get all the canticles
  List<OccasionalPrayerModel> _ops(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
        return OccasionalPrayerModel(
              id: doc.id
            , category: doc.data()['category'] ?? ""
            , title: doc.data()['title'] ?? ""
            , prayer: doc.data()['prayer'] ?? ""
            , source: doc.data()['source'] ?? ""
        );
    }).toList();
  }
}