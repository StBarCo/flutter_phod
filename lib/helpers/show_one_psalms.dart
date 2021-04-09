import 'package:flutter/material.dart';
import 'package:legereme/helpers/psalm_verses.dart';
import 'package:legereme/models/psalm_model.dart';

class ShowOnePsalm extends StatelessWidget {
  PsalmModel psalm;
  ShowOnePsalm({Key key, this.psalm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool psalmNotAvailable = psalm.vss == null;
    return (psalmNotAvailable) ? Container() : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            "${psalm.name}  ${psalm.title}",
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 2.0,
            ),
          ),
          PsalmVerses(vss: psalm.vss),
        ]
    );

  }
}


