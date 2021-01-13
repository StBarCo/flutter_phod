import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/controllers/collectController.dart';
import 'package:flutter_phod/models/collect.dart';
import 'package:flutter_phod/models/liturgical_day.dart';

CollectController c = Get.put( CollectController());
class CollectDB {

  final CollectionReference collectCollection = FirebaseFirestore.instance
      .collection('collects');


  void getCollect(LiturgicalDay litDay, String ofType) {
    getCollectByName(collectDocName(litDay, ofType), ofType);
  }

  void getCollectByName(String collectName, String ofType)  {
    //return await collectCollection.doc(collectName).get();
    Future resp = collectCollection.doc(collectName).get();
    resp
    .then( (snapshot) {
      if(snapshot.data() == null) return;
      CollectModel collect = CollectModel.fromDocumentSnapshot(snapshot);
      c.setCollect(collect, ofType);
      return;
    })
    .catchError( (err) {
      print("!!!!! Error getting collect (CollecDB): $err");
      return;
    });
  }
}

  String collectDocName(LiturgicalDay litDay, String ofType) {
    switch( ofType ) {
      case "week":
        // RLDs don't have week set, i.e. null. Interpolation will cause
        // the string "null" to be added unless we check for null
        // that's why the null test in the next line
        return "collect_${litDay.season.id}${litDay.season.week ?? ""}";
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
