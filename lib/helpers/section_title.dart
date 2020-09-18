import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/reference.dart';

class SectionTitle extends StatelessWidget {
  String text;
  String ref;
  bool italic;
  SectionTitle({Key key, this.text, this.ref='', this.italic = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var thisFontStyle = italic ? FontStyle.italic : FontStyle.normal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
            text
          , style: TextStyle(
                fontSize: 20.0
              , color: Colors.blue[800]
              , fontStyle: thisFontStyle
            )
        ),
        /*
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: text,
                  style: TextStyle( fontSize: 20.0)
              ),
              Reference(text: ref)]
            ),
        ),

         */
        SizedBox(height: 12.0),
      ]
    );
  }
}
