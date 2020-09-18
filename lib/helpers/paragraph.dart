import 'package:flutter/material.dart';

import 'compress_white_space.dart';

class Paragraph extends StatelessWidget {
  // String text;
  Paragraph(this.text);
  final String text;
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          SizedBox(height: 1.0)
        , Text(CompressWhiteSpace(text))
        , SizedBox(height: 12.0)
      ]
    );
  }
}
