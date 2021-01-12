import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:flutter_phod/models/world_english_bible.com.dart';
import 'package:flutter_phod/services/citation_parser.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class Lesson {
  String passage;
  String style;

  Lesson({this.passage, this.style});

}

class WEBDB {
  final CollectionReference WEBCollection = FirebaseFirestore.instance.collection('web');

  Future<WEB> getVss(String ref) async {
    List refCodes = parseCitation(ref)[0];
    String from = "web" + refCodes[0].toString();
    String to = "web" + refCodes[1].toString();
    var snapshots = await WEBCollection
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: from)
        .where(FieldPath.documentId, isLessThanOrEqualTo: to)
        .get();

    WEB webVss = WEB.getDocumentSnapshot(snapshots.docs);
    return webVss;
  }

}

class ScriptureDB {
  final CollectionReference dailyLectionaryCollection = FirebaseFirestore.instance.collection('lectionary');
  final CollectionReference sundaylectionaryCollection = FirebaseFirestore.instance.collection('sunday_lectionary');
  final CollectionReference webCollection = FirebaseFirestore.instance.collection('web');
  final String authToken = "Token 77f1ef822a19e06867cf335a168713f9d2159bfc";

  // axios.get('https://api.esv.org/v3/passage/html?q=' + ref + ";include-audio-link=false")
  final String esvUrl = 'https://api.esv.org/v3/passage/html?q=';
  final String esvOptions = ";include-audio-link=false";

  Future getFromEsv(String ref) async {
    String xref = "Tobit 1:1-end";
    String query = "$esvUrl$xref$esvOptions";
    Response resp = await get
      ( query
      , headers: { HttpHeaders.authorizationHeader: authToken }
      );
    if ( resp.statusCode == 200 ) {
      Map body = jsonDecode(resp.body);
      // if ESV fails to parse a ref, e.g. Tobit 1:1-10,
      // it does not fail, but returns mostly empty data
      // we check to see if the "parsed" field is empty
      if(body['parsed'].isEmpty) return getFromWEB(xref);
      return Lesson(passage: body['passages'][0], style: 'req');
    }
    else { return getFromWEB(xref); };
  }

  Future<Lesson> getFromWEB( String ref) async {
    WEB web = await WEBDB().getVss(ref);
    return Lesson( passage: web.passage, style: 'req');
  }

  
  Future getDailyESV( LiturgicalDay litDay, int lesson) async {
    String lessonKey = "${litDay.service}${lesson}";
    var dailyRefs = await getDailyRef(litDay);

      var x = dailyRefs.get(lessonKey).map( (r) { return r['read']; });
      String esvRefs = dailyRefs.get(lessonKey).map( (r) { return r['read']; }).join(';');
      return await getFromEsv(esvRefs);
  }

  Future getDailyRef (LiturgicalDay litDay) async {
    // String lessonKey = "${litDay.service}${lesson}";
    String docId = "mpep${litDay.now.month.toString().padLeft(2,'0')}${litDay.now.day.toString().padLeft(2, '0')}";
    return dailyLectionaryCollection.doc(docId).get();
  }

  Future getServiceRefs(LiturgicalDay litDay, String service) async {
    if (service == "eu") {
      String docId;
      if (litDay.season.week == null) {
        // season.week is null on RLDs
        docId = litDay.season.id;
      }
      else {
        docId = "${litDay.season.id}${litDay.season.week}${litDay.litYear}";
      }
      return sundaylectionaryCollection.doc(docId).get();
    }
    return getDailyRef(litDay);
  }
}