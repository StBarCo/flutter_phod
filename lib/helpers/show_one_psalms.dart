import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/psalm_verses.dart';

class ShowOnePsalm extends StatelessWidget {
  var psalm;
  ShowOnePsalm({Key key, this.psalm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (psalm == null) ? Container() : Column(
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


