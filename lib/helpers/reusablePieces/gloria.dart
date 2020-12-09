import 'package:flutter/material.dart';
import '../parts.dart';

class Gloria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            Line(text: "Glory be to the Father, and to the Son, and to the Holy Spirit;")
          , Line(text: "as it was in the beginning, is now, and ever shall be,")
          , Line(text: "world without end. Amen.")
        ]
    );
  }
}
