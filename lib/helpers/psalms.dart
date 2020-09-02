import 'package:flutter/material.dart';
import 'package:flutter_phod/services/database.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';
import 'package:flutter_phod/stores/psalm_map.dart';

class Psalms extends StatefulWidget {
  List<Ps> pss;
  Psalms({Key key, this.pss}) : super(key: key);
  @override
  _PsalmsState createState() => _PsalmsState();
}

class _PsalmsState extends State<Psalms> {
  Future futurePsalms;

  @override

  void initState() {
    super.initState();
    futurePsalms = _getPsalms();
  }

  _getPsalms() async {
    return await DatabaseService().getPsalms(widget.pss);
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurePsalms,
      builder: (context, snapshot) {
        switch( snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Psalms go here");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text("Waiting for Psalms");
          case ConnectionState.done:
            print("SNAPSHOT DATA: ${snapshot.data}");
            return ShowPsalms(pss: snapshot.data); // snapshot data
          default:
            return Text('PSALMS GO HERE');
        }
      }
    );
  }
}

class ShowPsalms extends StatelessWidget {
  var pss;
  ShowPsalms({Key key, this.pss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: pss.map<Widget>( (p) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                  "${p.name}  ${p.title}",
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
              ),
              Verses(vss: p.vss),
              ]
        );
      }).toList()
    );
  }
}

class Verses extends StatelessWidget {
  List<PsalmVs> vss;
  Verses({Key key, this.vss}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: vss.map<Widget>( (v) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "${v.vsNumber} ${v.first}",
                style: TextStyle(
                  fontSize: 16.0
                )
            ),
            Text(
                "\t\t ${v.second}",
              style: TextStyle( fontSize: 16.0)
            ),
            SizedBox(height: 8.0),
          ]
        );
      }).toList()
    );
  }
}


