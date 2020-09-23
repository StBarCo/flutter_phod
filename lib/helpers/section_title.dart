import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/reference.dart';

class SectionTitle extends StatelessWidget {
  String text;
  String ref;
  bool italic;
  bool center;
  double leadingSpace;
  SectionTitle(
      { Key key
      , this.text
      , this.ref=''
      , this.italic = false
      , this.center = false
      , this.leadingSpace = 20.0
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var thisFontStyle = italic ? FontStyle.italic : FontStyle.normal;
    var alignment = center ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: alignment,
      children: <Widget>[
        SizedBox(height: leadingSpace),
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
