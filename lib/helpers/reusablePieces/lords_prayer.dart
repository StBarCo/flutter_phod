import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';


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
        Rubric( text: "Officiant and People"),
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
        Line( indent: 1, text: "hallowed be your Name,"),
        Line( indent: 1, text: "your kingdom come,"),
        Line( indent: 1, text: "your will be done,"),
        Line( indent: 1, text: "on earth as it is in heaven."),
        Line( text: "Give us today our daily bread."),
        Line( text: "And forgive us our sins,"),
        Line( indent: 1, text: "as we forgive those"),
        Line( indent: 1, text: "who sin against us."),
        Line( text: "Save us from the time of trial,"),
        Line( indent: 1, text: "and deliver us from evil."),
        Line( text: "For the kingdom, the power,"),
        Line( indent: 1, text: "and the glory are yours,"),
        Line( indent: 1, text: "now and for ever. Amen."),

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
        Line( indent: 1, text: "hallowed be thy Name,"),
        Line( indent: 1, text: "thy kingdom come,"),
        Line( indent: 1, text: "thy will be done,"),
        Line( indent: 1, text: "on earth as it is in heaven."),
        Line( text: "Give us this day our daily bread."),
        Line( text: "And forgive us our trespasses,"),
        Line( indent: 1, text: "as we forgive those"),
        Line( indent: 1, text: "who trespass against us."),
        Line( text: "And lead us not into temptation,"),
        Line( indent: 1, text: "but deliver us from evil."),
        Line( text: "For thine is the kingdom,"),
        Line( indent: 1, text: "and the power, and the glory,"),
        Line( indent: 1, text: "for ever and ever. Amen."),
      ]
    );
  }
}

