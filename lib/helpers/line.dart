import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  String text;
  bool indent;
  bool bold;
  bool smallcaps;
  bool center;
  bool italic;
  Line({
      Key key
    , this.text = ''
    , this.indent = false
    , this.bold = false
    , this.smallcaps = false // can't find a way to do this
    , this.center = false
    , this.italic = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double inset = indent ? 40 : 10;
    final FontWeight fw = bold ? FontWeight.bold : FontWeight.normal;
    final Alignment align = center ? Alignment.center : Alignment.centerLeft;
    final FontStyle it = italic ? FontStyle.italic : FontStyle.normal;
    return Container(
        alignment: align,
        margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: inset),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: fw,
              fontStyle: it,
            )

        )
    );
  }
}
