import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_util/date_util.dart';
import 'package:flutter_phod/stores/helpers.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';

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


class PsalmMap {
  String name = '';
  String title = '';
  List<PsalmVs> vss = [];
/*
  PsalmMap( String name, String title, List<PsalmVs> vss) {
    this.name = name;
    this.title = title;
    this.vss = vss;
  }

 */

  PsalmMap( Ps ps, DocumentSnapshot snapshot) {
    final int from = ps.from;
    final int to = ps.to;
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
    this.name = snapshot.get('name');
    this.title = snapshot.get('title');
    this.vss = pss;
  }
}

