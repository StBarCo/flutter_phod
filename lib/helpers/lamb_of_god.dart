import 'package:flutter/material.dart';

import 'line.dart';
class LambOfGod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>
        [ Line(text: "Lamb of God, you take away the sin of the world;")
        , Line(text: "have mercy on us.", indent: true, bold: true)
        , Line(text: "Lamb of God, you take away the sin of the world;")
        , Line(text: "have mercy on us.", indent: true, bold: true)
        , Line(text: "Lamb of God, you take away the sin of the world;")
        , Line(text: "grant us your peace.", indent: true, bold: true)
        ]
    );
  }
}
