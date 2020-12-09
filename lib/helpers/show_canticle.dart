import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/services/canticles_db.dart';

class TodaysCanticle extends StatefulWidget {
  int lesson;
  LitDay litDay;
  String named;
  TodaysCanticle({Key key, this.litDay, this.lesson = 0, this.named = ""}) : super(key: key);
  @override
  _TodaysCanticleState createState() => _TodaysCanticleState();
}

class _TodaysCanticleState extends State<TodaysCanticle> {
  Future futureCanticle;
  @override

  void  initState() {
    super.initState();
    futureCanticle = _getCanticle();
  }

  _getCanticle() async {
    return (widget.named == "")
        ? await CanticleDB().getCanticle(widget.litDay, widget.lesson)
        : await CanticleDB().getCanticleByName(widget.named);
  }
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCanticle,
        builder: (context, snapshot) {
          switch( snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Canticle goes here");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text("Waiting for Canticle");
            case ConnectionState.done:
              return ShowCanticle(canticle: snapshot.data); // snapshot data
            default:
              return Text('CANTICLE GOES HERE');
          }
        }
    );
  }
}

class ShowCanticle extends StatelessWidget {
  var canticle;
  ShowCanticle({Key key, this.canticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (canticle == null)
      ? Text("Canticles unavailable")
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionTitle(text: "Canticle ${canticle.number}",),
          ItemTitle(text: canticle.name,),
          Rubric( text: canticle.notes),
          PhrasedParagraph([Text(canticle.text)]),
        ]
    );
  }
}
