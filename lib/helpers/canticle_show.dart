import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/services/canticles_db.dart';
import 'package:flutter_phod/helpers/canticle_list.dart';

class TodaysCanticle extends StatelessWidget {
  int lesson;
  LitDay litDay;
  String named;
  TodaysCanticle({Key key, this.litDay, this.lesson = 0, this.named = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CanticleListContainer(recommended: getTodaysCanticleName(litDay, lesson),);
  }

}

class ShowCanticle extends StatelessWidget {
  final Canticle canticle;
  ShowCanticle({Key key, this.canticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (canticle == null)
      ? Text("Canticles unavailable")
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SectionTitle(text: "Canticle ${canticle.number}",trailingSpace: 0,),
          ItemTitle(text: canticle.title,leadingSpace: 0, trailingSpace: 0, ),
          Rubric( text: canticle.notes, leadingSpace: 0,  ),
          PhrasedParagraph(content: [Text(canticle.text)]),
        ]
    );
  }
}
