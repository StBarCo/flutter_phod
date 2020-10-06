import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'compress_white_space.dart';

class Paragraph extends StatelessWidget {
  // String text;
  TextStyle style;
  Paragraph(this.text, {this.style});
  final String text;

  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          SizedBox(height: 1.0)
        , Text
            ( CompressWhiteSpace(text)
            , style: style
      )
        , SizedBox(height: 12.0)
      ]
    );
  }
}
