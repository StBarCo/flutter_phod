import 'package:flutter/material.dart';
import 'package:legereme/helpers/rubric.dart';
import 'package:legereme/helpers/line.dart';
import 'package:legereme/helpers/section_title.dart';

class LordsPrayer extends StatefulWidget {
  @override
  _LordsPrayerState createState() => _LordsPrayerState();
}

class _LordsPrayerState extends State<LordsPrayer> {
  String ofType = "Traditional";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(text: "The Lord's Prayer"),
        Rubric("Officiant and People"),
        RaisedButton(
          onPressed: () {
            setState(() {
              ofType = (ofType == "Traditional") ? "Modern" : "Traditional";
            });
          },
          child: Text("Show ${ (ofType == "Traditional") ? "Modern" : "Traditional" }")
        ),
        (ofType == "Traditional") ? ShowTraditional() : ShowModern()
      ]
    );
  }
}

class ShowModern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Line( text: "Our Father in heaven"),
        Line( indent: true, text: "hallowed be your Name,"),
        Line( indent: true, text: "your kingdom come,"),
        Line( indent: true, text: "your will be done,"),
        Line( indent: true, text: "on earth as it is in heaven."),
        Line( text: "Give us today our daily bread."),
        Line( text: "And forgive us our sins,"),
        Line( indent: true, text: "as we forgive those"),
        Line( indent: true, text: "who sin against us."),
        Line( text: "Save us from the time of trial,"),
        Line( indent: true, text: "and deliver us from evil."),
        Line( text: "For the kingdom, the power,"),
        Line( indent: true, text: "and the glory are yours,"),
        Line( indent: true, text: "now and for ever. Amen."),

      ]
    );
  }
}

class ShowTraditional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Line( text: "Our Father, who art in heaven"),
        Line( indent: true, text: "hallowed be thy Name,"),
        Line( indent: true, text: "thy kingdom come,"),
        Line( indent: true, text: "thy will be done,"),
        Line( indent: true, text: "on earth as it is in heaven."),
        Line( text: "Give us this day our daily bread."),
        Line( text: "And forgive us our trespasses,"),
        Line( indent: true, text: "as we forgive those"),
        Line( indent: true, text: "who trespass against us."),
        Line( text: "And lead us not into temptation,"),
        Line( indent: true, text: "but deliver us from evil."),
        Line( text: "For thine is the kingdom,"),
        Line( indent: true, text: "and the power, and the glory,"),
        Line( indent: true, text: "for ever and ever. Amen."),
      ]
    );
  }
}

