import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/psalm_verses.dart';

class ShowOnePsalm extends StatelessWidget {
  var psalm;
  ShowOnePsalm({Key key, this.psalm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (psalm == null) ? Container() : Column(
        children:[

          SectionTitle(text:
            "${psalm.name}"

          ),
          ItemTitle(text: "${psalm.title}", leadingSpace: 0,),
          PsalmVerses(vss: psalm.vss),
        ]
    );

  }
}


