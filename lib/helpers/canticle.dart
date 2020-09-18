import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/services/cantiles_db.dart';

class Canticle extends StatefulWidget {
  int lesson;
  LitDay litDay;
  Canticle({Key key, this.litDay, this.lesson}) : super(key: key);
  @override
  _CanticleState createState() => _CanticleState();
}

class _CanticleState extends State<Canticle> {
  Future futureCanticle;
  @override

  void  initState() {
    super.initState();
    futureCanticle = _getCanticle();
  }

  _getCanticle() async {
    return await CanticleDB().getCanticle(widget.litDay, widget.lesson);
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                canticle.get('number'),
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0
                )
              ),
              Text(
                canticle.get('name'),
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontStyle: FontStyle.italic
                )
              ),
            ]
          ),
          Rubric(canticle.get('notes')),
          Text(
            canticle.get('text'),
            style: TextStyle(
              fontSize: 16.0,
              )
          ),
        ]
    );
  }
}
