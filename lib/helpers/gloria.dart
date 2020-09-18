import 'package:flutter/material.dart';

class Gloria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            Text("Glory be to the Father, and to the Son, and to the Holy Spirit;")
          , Text("as it was in the beginning, is now, and ever shall be,")
          , Text("world without end. Amen.")
        ]
    );
  }
}
