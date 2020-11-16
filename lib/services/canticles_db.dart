import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/stores/season.dart';

class Canticle {
  String id;
  String name;
  String notes;
  String number;
  String reference;
  String text;
  String title;

  Canticle({this.id, this.name, this.notes, this.number, this.reference, this.text, this.title});
}

class CanticleDB {

  final CollectionReference canticleCollection = FirebaseFirestore.instance.collection('canticles');

  Stream<List<Canticle>> get canticles {
    return canticleCollection.snapshots().map(_canticleListFromSnapshot);
  }

 // get all the canticles
 List<Canticle> _canticleListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map( (doc) {
      return Canticle(
          id: doc.data()['_id'] ?? ""
        , name: doc.data()['name'] ?? ""
        , notes: doc.data()['notes'] ?? ""
        , number: doc.data()['number'] ?? ""
        , reference: doc.data()['reference'] ?? ""
        , text: doc.data()['text'] ?? ""
        , title: doc.data()['title'] ?? ""
      );
    }).toList();
 }

  Future getCanticle(LitDay litDay, int lesson) async {
    String key = canticle(
        "${litDay.service}${lesson}_${litDay.season.id}_${litDay.season.week}"
    );
    key ??= "${litDay.service}${lesson}_${litDay.now.weekday}";
    // for the programmer: weekday for sunday is 7 (not 0)
    String docName = canticle(key);
    print("CANTICLE KEY: ${docName}; $key");
    return await getCanticleByName(docName);
}

  Future getCanticleByName(String name) async {
    return canticleCollection.doc(name).get();
  }

}
String canticle(String key) {
  return {
      "mp1_advent_0": "surge_illuminare"
    , "mp1_easter_0": "cantate_domino"
    , "mp1_easter_4": "cantate_domino"
    , "mp1_easter_5": "cantemu_domino" // song of moses (horse and rider)
    , "mp1_easterWeek_5": "te_deum"
    , "mp1_lent_0": "kyrie_pantokrator"
    , "mp1_lent_3": "kyrie_pantokrator"
    , "mp1_lent_5": "kyrie_pantokrator"
    , "mp1_ashWednesday_0": "kyrie_pantokrator"
    , "mp1_ashWednesday_3": "kyrie_pantokrator"
    , "mp1_ashWednesday_5": "kyrie_pantokrator"
    , "mp2_advent_0": "benedictus"
    , "mp2_advent_4": "magna_et_mirabilia"
    , "mp2_lent_0": "benedictus"
    , "mp2_lent_5": "benedictus"
    , "mp2_ashWednesday_0": "benedictus"
    , "mp2_ashWednesday_5": "benedictus"
    , "mp2_ashWednesday_2": "deus_misereatur"
    , "mp2_lent_2": "deus_misereatur"
    , "mp2_lent_4": "magna_et_mirabilia"
    , "mp2_ashWednesday_4": "magna_et_mirabilia"
    , "mp1_7": "benedictus"
    , "mp1_1": "ecce_deus"
    , "mp1_2": "benedictus_es_domine"
    , "mp1_3": "surge_illuminare"
    , "mp1_4": "deus_misereatur"
    , "mp1_5": "quaerite_dominum"
    , "mp1_6": "benedicite_omnia_opera_domini"
    , "mp2_7": "te_deum_laudamus"
    , "mp2_1": "magna_et_mirabilia"
    , "mp2_2": "dignus_es"
    , "mp2_3": "benedictus"
    , "mp2_4": "gloria_in_excelsis"
    , "mp2_5": "dignus_es"
    , "mp2_6": "magna_et_mirabilia"
    , "ep1_7": "magnificat"
    , "ep1_1": "magnificat"
    , "ep1_2": "magnificat"
    , "ep1_3": "magnificat"
    , "ep1_4": "magnificat"
    , "ep1_5": "magnificat"
    , "ep1_6": "magnificat"
    , "ep2_0": "nunc_dimittis"
    , "ep2_1": "nunc_dimittis"
    , "ep2_2": "nunc_dimittis"
    , "ep2_3": "nunc_dimittis"
    , "ep2_4": "nunc_dimittis"
    , "ep2_5": "nunc_dimittis"
    , "ep2_6": "nunc_dimittis"
  }[key];
}