import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';
import 'package:flutter_phod/stores/psalm_map.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference psalmsCollection = FirebaseFirestore.instance.collection('psalms');
  final CollectionReference WEBibleCollection = FirebaseFirestore.instance.collection('WEBible');

  Stream<QuerySnapshot> get psalms {
    return psalmsCollection.snapshots();
  }

  Stream<QuerySnapshot> get weBible {
    return WEBibleCollection.snapshots();
  }

  Future getPsalms(List<Ps> pss) async {
      List<String> keys = pss.map((p) => 'acna${p.ps}').toList();
      var resp = await Future.wait(keys.map((k) {
        return psalmsCollection.doc(k).get();
      }));
      return resp.asMap().entries.map( (el) {
        var idx = el.key;
        var ps = el.value;
        return PsalmMap(pss[idx], ps);
      });
    }

}