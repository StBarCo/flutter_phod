import 'package:cloud_firestore/cloud_firestore.dart';

class PsalmVs {
  String vsNumber = '';
  String first = '';
  String second = '';
  String hebrew = '';

  PsalmVs(String vsNumber, String first, String second, String hebrew) {
    this.vsNumber = vsNumber ?? '';
    this.first = first;
    this.second = second;
    this.hebrew = hebrew ?? '';
  }
}

class Ps {
  int ps;
  int from;
  int to;

  Ps(int ps, int from, int to) {
    this.ps = ps;
    this.from = from;
    this.to = to;
  }
}

class PsalmModel {
  String id;
  String name = '';
  String title = '';
  int from;
  int to;
  List<PsalmVs> vss = [];

  PsalmModel(
    { this.id
    , this.name
    , this.title
    , this.from
    , this.to
    , this.vss
    }
  );

  PsalmModel.fromDocumentSnapshot( Ps ps, DocumentSnapshot snapshot) {
    from = ps.from;
    to = ps.to;
    List<PsalmVs> pss = [];
    for( var i = ps.from; i <= ps.to; i++ ) {
      String key = i.toString();
      if (snapshot.data().containsKey(key)) {
        dynamic pvs = snapshot.get(key);
        pss.add(PsalmVs(key, pvs['first'], pvs['second'], pvs['hebrew']));
      }
      else {
        break;
      }
    }

    id = snapshot.id;
    name = snapshot.get('name');
    title = snapshot.get('title');
    vss = pss;
  }
}

