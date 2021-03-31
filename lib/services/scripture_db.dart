import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/controllers/lessonController.dart';
import 'package:flutter_phod/models/daily_lectionary_model.dart';
import 'package:flutter_phod/models/eucharist_lectionary_model.dart';
import 'package:flutter_phod/models/psalm_model.dart';
import 'package:flutter_phod/services/psalms_db.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:flutter_phod/models/world_english_bible.com.dart';
import 'package:flutter_phod/services/citation_parser.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter_phod/models/lesson_model.dart';
import 'package:flutter_phod/controllers/liturgicalCalendarController.dart';

LessonController lc = Get.put(LessonController());

class WEBDB {
  final CollectionReference WEBCollection = FirebaseFirestore.instance.collection('web');

  Future<WEB> getVss(String ref) async {
    List refCodes = parseCitation(ref);
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
  final CollectionReference dailyLectionaryCollection = FirebaseFirestore
      .instance.collection('lectionary');
  final CollectionReference sundaylectionaryCollection = FirebaseFirestore
      .instance.collection('sunday_lectionary');
  final CollectionReference webCollection = FirebaseFirestore.instance
      .collection('web');
  final String authToken = "Token 77f1ef822a19e06867cf335a168713f9d2159bfc";

  // axios.get('https://api.esv.org/v3/passage/html?q=' + ref + ";include-audio-link=false")
  final String esvUrl = 'https://api.esv.org/v3/passage/html?q=';
  final String esvOptions = ";include-audio-link=false";

  Future<LessonModel> getFromEsv(String ref) async {
    String query = "$esvUrl$ref$esvOptions";
    var resp = await get
      (query
        , headers: { HttpHeaders.authorizationHeader: authToken}
    );
    if (resp.statusCode == 200) {
      Map body = jsonDecode(resp.body);
      // if ESV fails to parse a ref, e.g. Tobit 1:1-10,
      // it does not fail, but returns mostly empty data
      // we check to see if the "parsed" field is empty
      if (body['parsed'].isEmpty) return getFromWEB(ref);
      return LessonModel(passage: body['passages'].join(' '),
          style: 'req',
          source: 'ESV',
          ref: ref);
    }
    return getFromWEB(ref);
  }

  Future<LessonModel> getFromWEB(String ref) async {
    WEB web = await WEBDB().getVss(ref);
    return LessonModel(
        passage: web.passage, style: 'req', source: 'WEB', ref: ref);
  }

  void getEucharisticLessons(LiturgicalDay litDay) async {
    String litSeason = litDay.season.id + litDay.season.week.toString() +
        litDay.litYear;
    var sundayRefs = await getSundayRefs(litSeason);
    EucharistLectionaryModel lessons = EucharistLectionaryModel
        .fromDocumentSnapshot(sundayRefs);
    // got all the references, now I have to get the content!
    LessonModel eg = lessons.entryGospel.isNotEmpty
        ? await getFromEsv(esvQueryString(lessons.entryGospel))
        : new LessonModel();
    lc.setLesson(eg, 'entryGospel');
    List<Ps> pss = lessons.psalms.map<Ps>((s) => parsePsalmCitation(s.read))
        .toList();
    PsalmsDB().getListOfPsalms(pss);
    LessonModel ot = lessons.ot.isNotEmpty
        ? await getFromEsv(esvQueryString(lessons.ot))
        : new LessonModel();
    lc.setLesson(ot, 'ot');
    LessonModel nt = lessons.nt.isNotEmpty
        ? await getFromEsv(esvQueryString(lessons.nt))
        : new LessonModel();
    lc.setLesson(nt, 'nt');
    LessonModel gs = lessons.gs.isNotEmpty
        ? await getFromEsv(esvQueryString(lessons.gs))
        : new LessonModel();
    lc.setLesson(gs, 'gs');
  }


  void getDailyESV(LiturgicalDay litDay) async {
    String lesson1 = "${litDay.service}1";
    String lesson2 = "${litDay.service}2";
    Future resp = getDailyRef(litDay);
    resp
        .then((snapshot) async {
      DailyLectionaryModel refs = DailyLectionaryModel.fromDocumentSnapshot(
          snapshot);
      LessonModel firstReading = await getFromEsv(
          esvQueryString(refs.readingModel(lesson1)));
      lc.setLesson(firstReading, 1);
      LessonModel secondReading = await getFromEsv(
          esvQueryString(refs.readingModel(lesson2)));
      lc.setLesson(secondReading, 2);
    })
        .catchError((err) => print("!!!!! COULDN'T GET REFS: $err"));
  }

  Future getDailyRef(LiturgicalDay litDay) async {
    // String lessonKey = "${litDay.service}${lesson}";
    String docId = "mpep${litDay.now.month.toString().padLeft(2, '0')}${litDay
        .now.day.toString().padLeft(2, '0')}";
    return dailyLectionaryCollection.doc(docId).get();
  }

  Future getSundayRefs(String seasonId) async {
    return sundaylectionaryCollection.doc(seasonId).get();
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

  Future<void> getRandomScripture(String ref) async {
    LessonModel lesson = await getFromEsv(ref);
    lc.setLesson(lesson, null);
  }

  void getLessons() {
    LiturgicalCalendarController calcon = Get.put( LiturgicalCalendarController() );
    String selectedService = calcon.selectedService;
    LiturgicalDay day = calcon.selectedDay.litDay;
    switch (selectedService) {
      case 'mp':
      case 'ep':
        getDailyESV(day);
        break;
      default:
        getEucharisticLessons(day);
    }
  }
}