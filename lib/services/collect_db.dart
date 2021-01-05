import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/models/collect.dart';
import 'package:flutter_phod/models/liturgical_day.dart';

class CollectDB {

  final CollectionReference collectCollection = FirebaseFirestore.instance.collection('collects');


  Future<CollectModel> getCollect( LiturgicalDay litDay, String ofType) async {
    String docName = collectDocName(litDay, ofType);
    // var resp = await collectCollection.doc(docName).get(); ) async {
    try {
    DocumentSnapshot doc = await collectCollection.doc(docName).get();
    CollectModel resp = CollectModel.fromDocumentSnapshot(doc);
    return resp;
    }
    catch (e) {
    print('>>>>> ERROR getting user: $e');
    rethrow;
    }
    }
  }

/*
  Future<CollectModel> getCollect(LiturgicalDay litDay, String ofType) async {
    String docName = collectDocName(litDay, ofType);
    DocumentSnapshot snapshot = await collectCollection.doc(docName).get();
    return CollectModel.fromDocumentSnapshot(snapshot);
  }
*/
  String collectDocName(LiturgicalDay litDay, String ofType) {
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
