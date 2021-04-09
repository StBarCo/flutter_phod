import 'package:flutter/material.dart';
import 'package:legereme/helpers/rubric.dart';
import 'package:legereme/helpers/versical.dart';

class WordOfTheLord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          Rubric("At the end of the reading is said")
        , Versical( speaker: "", says: "The Word of the Lord.")
        , Versical( speaker: "People", says: "Thanks be to God.")

        ]
    );
  }
}
