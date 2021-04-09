import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legereme/models/user.dart';
import 'package:legereme/stores/psalm_map.dart';

class DatabaseService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference psalmsCollection = FirebaseFirestore.instance.collection('psalms');
  final CollectionReference WEBibleCollection = FirebaseFirestore.instance.collection('WEBible');

  Future<bool> createNewUser( UserModel user ) async {
    try {
      await _fireStore.collection('users').doc(user.id).set({
        "name": user.name,
        "email": user.email
      });
      return true;
    }
    catch(e) {
      return false;
    }
}

  Future<UserModel> getUser( String uid ) async {
    try {
      DocumentSnapshot doc = await _fireStore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    }
    catch (e) {
      rethrow;
    }
  }

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

    Future getPsalmByName(Ps ps ) async {
      var resp = await psalmsCollection.doc("acna${ps.ps}").get();
      PsalmMap pm = PsalmMap(ps, resp);
      return pm;
    }
}

