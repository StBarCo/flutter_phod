import 'package:flutter/material.dart';
import 'package:legereme/helpers/rubric.dart';
import 'package:legereme/models/canticle.dart';
import 'package:legereme/models/liturgical_day.dart';
import 'package:legereme/services/canticles_db.dart';

class TodaysCanticle extends StatefulWidget {
  int lesson;
  LiturgicalDay litDay;
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
              return ShowCanticle(snapshot.data); // snapshot data
            default:
              return Text('CANTICLE GOES HERE');
          }
        }
    );
  }
}

class ShowCanticle extends StatelessWidget {

  ShowCanticle(this.canticle);
  final CanticleModel canticle;
  @override
  Widget build(BuildContext context) {
    return (canticle == null)
      ? Text("Canticles unavailable")
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                canticle.number,
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0
                )
              ),
              Text(
                canticle.name,
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontStyle: FontStyle.italic
                )
              ),
            ]
          ),
          Rubric(canticle.notes),
          Text(
            canticle.text,
            style: TextStyle(
              fontSize: 16.0,
              )
          ),
        ]
    );
  }
}
