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
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                shape: Border(
                    bottom: BorderSide(
                        color: ofType == "Traditional" ? Theme.of(context).primaryColorDark : Colors.transparent, width: 2.0
                    )
                ),
                child: FlatButton(
                  child: Text('Traditional', style: TextStyle(color: ofType != 'Traditional' ? Colors.black54 : Colors.black),),
                  onPressed: (){
                    setState(() {
                      ofType = "Traditional";
                    });
                  },
                ),
              ),
              Material(
                shape: Border(
                    bottom: BorderSide(
                        color: ofType == "Modern" ? Theme.of(context).primaryColorDark : Colors.transparent, width: 2.0
                    )
                ),
                child: FlatButton(
                  child: Text('Modern', style: TextStyle(color: ofType == 'Traditional' ? Colors.black54 : Colors.black),),
                  onPressed: (){
                    setState(() {
                      ofType = "Modern";
                    });
                  },
                ),
              ),
            ],

          ),
          Rubric(text: "Officiant and People"),
          (ofType == "Traditional") ? ShowTraditional() : ShowModern()
        ]);
  }
}

class ShowModern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph(content: [
      Line(text: "Our Father in heaven", bold: true),
      Line(indent: 1, text: "hallowed be your Name,", bold: true),
      Line(indent: 1, text: "your kingdom come,", bold: true),
      Line(indent: 1, text: "your will be done,", bold: true),
      Line(indent: 1, text: "on earth as it is in heaven.", bold: true),
      Line(text: "Give us today our daily bread.", bold: true),
      Line(text: "And forgive us our sins,", bold: true),
      Line(indent: 1, text: "as we forgive those", bold: true),
      Line(indent: 1, text: "who sin against us.", bold: true),
      Line(text: "Save us from the time of trial,", bold: true),
      Line(indent: 1, text: "and deliver us from evil.", bold: true),
      Line(text: "For the kingdom, the power,", bold: true),
      Line(indent: 1, text: "and the glory are yours,", bold: true),
      Line(indent: 1, text: "now and for ever. Amen.", bold: true),
    ]);
  }
}

class ShowTraditional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph(content: [
      Line(text: "Our Father, who art in heaven", bold: true),
      Line(indent: 1, text: "hallowed be thy Name,", bold: true),
      Line(indent: 1, text: "thy kingdom come,", bold: true),
      Line(indent: 1, text: "thy will be done,", bold: true),
      Line(indent: 1, text: "on earth as it is in heaven.", bold: true),
      Line(text: "Give us this day our daily bread.", bold: true),
      Line(text: "And forgive us our trespasses,", bold: true),
      Line(indent: 1, text: "as we forgive those", bold: true),
      Line(indent: 1, text: "who trespass against us.", bold: true),
      Line(text: "And lead us not into temptation,", bold: true),
      Line(indent: 1, text: "but deliver us from evil.", bold: true),
      Line(text: "For thine is the kingdom,", bold: true),
      Line(indent: 1, text: "and the power, and the glory,", bold: true),
      Line(indent: 1, text: "for ever and ever. Amen.", bold: true),
    ]);
  }
}
