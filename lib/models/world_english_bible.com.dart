import 'package:cloud_firestore/cloud_firestore.dart';

class WEBVerse {
  String id = "";
  String book = "";
  int chap = 0;
  int vsNumber = 0;
  String text = "";

  WEBVerse({this.book, this.chap, this.vsNumber, this.text});

  WEBVerse.fromDocumentSnapshot( DocumentSnapshot snapshot) {
    id = snapshot.id;
    book = snapshot.data()["book"];
    chap = snapshot.data()["chap"];
    vsNumber = snapshot.data()["vs"];
    text = snapshot.data()["vss"];
  }
}

class WEB {
  List<WEBVerse> vss = [];
  String passage = "";

  WEB({this.vss});

  WEB.getDocumentSnapshot( snapshots) {
    this.vss =
      snapshots.map( (snapshot) => WEBVerse.fromDocumentSnapshot(snapshot))
          .toList()
          .cast<WEBVerse>();
    // wrap passage in <div> for consistancy with ESV
    this.passage = "<div>" + (this.vss.map( (vs) => vs.text).toList().join(" ")) + '</div>';
    // change span to mark because flutter_html doesn't parse classes
    // ESV doesn't have any <mark> tags, so we'll use it for WEB vs numbers
    this.passage = this.passage.replaceAll('<span',  '<mark');
    this.passage = this.passage.replaceAll('</span', '</mark');

  }
}