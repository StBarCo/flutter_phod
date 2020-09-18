import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class Lesson {
  String passage;
  String style;

  Lesson({this.passage, this.style});

}

class ScriptureDB {
  final CollectionReference dailyLectionaryCollection = FirebaseFirestore.instance.collection('lectionary');
  final CollectionReference sundaylectionaryCollection = FirebaseFirestore.instance.collection('sunday_lectionary');
  final CollectionReference webCollection = FirebaseFirestore.instance.collection('web');
  final String authToken = "Token 77f1ef822a19e06867cf335a168713f9d2159bfc";

  // axios.get('https://api.esv.org/v3/passage/html?q=' + ref + ";include-audio-link=false")
  final String esvUrl = 'https://api.esv.org/v3/passage/html?q=';
  final String esvOptions = ";include-audio-link=false";

  Future getESV( LitDay litDay, int lesson) async {
    String lessonKey = "${litDay.service}${lesson}";
    var dailyRefs = await getDailyRef(litDay, lesson);

      var x = dailyRefs.get(lessonKey).map( (r) { return r['read']; });
      String esvRefs = dailyRefs.get(lessonKey).map( (r) { return r['read']; }).join(';');
      String query = "$esvUrl$esvRefs$esvOptions";
      Response resp = await get(
        query,
        headers: { HttpHeaders.authorizationHeader: authToken }
      );
      if ( resp.statusCode == 200) {
        Map body = jsonDecode(resp.body);
        return Lesson(passage: body['passages'][0], style: 'req');
      }
      else { throw('Cannot get lesson'); }
  }

  Future getDailyRef (LitDay litDay, int lesson) async {
    // String lessonKey = "${litDay.service}${lesson}";
    String docId = "mpep${litDay.now.month.toString().padLeft(2,'0')}${litDay.now.day.toString().padLeft(2, '0')}";
    return dailyLectionaryCollection.doc(docId).get();
  }
}