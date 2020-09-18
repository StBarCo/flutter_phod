import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/stores/litday.dart';

class CollectDB {

  final CollectionReference collectCollection = FirebaseFirestore.instance.collection('collects');

  Stream<QuerySnapshot> get collect {
    return collectCollection.snapshots();
  }

  Future getCollect(LitDay litDay, String ofType) async {
    String docName =collectDocName(litDay, ofType);
    return (docName == null) ? null : collectCollection.doc(docName).get();
  }

  String collectDocName(LitDay litDay, String ofType) {
    switch( ofType ) {
      case "week":
        return "collect_${litDay.season.id}${litDay.season.week}";
      case "day":
        return "collect_${nameOfDay(litDay.now.weekday)}_${litDay.service}";
      case "MPPeace":
        return (litDay.now.weekday != 2) ? "collect_tuesday_mp" : null;
      case "grace":
        return (litDay.now.weekday != 3) ? "collect_wednesday_mp" : null;
      case "EPPeace":
        return (litDay.now.weekday != 2) ? "collect_monday_ep" : null;
      case "perils":
        return (litDay.now.weekday != 2) ? "collect_tuesday_ep" : null;
      default:
        return null;
    }
  }

  String nameOfDay(int i) {
    // sunday is 7
    return [
      'undefined',
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday'
    ][i];
  }
}