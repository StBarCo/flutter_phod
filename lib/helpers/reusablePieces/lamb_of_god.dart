import 'package:flutter/material.dart';

import '../parts.dart';
class LambOfGod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph(
        [ Line(text: "Lamb of God, you take away the sin of the world;")
        , Line(text: "have mercy on us.", indent: 1, bold: true)
        , Line(text: "Lamb of God, you take away the sin of the world;")
        , Line(text: "have mercy on us.", indent: 1, bold: true)
        , Line(text: "Lamb of God, you take away the sin of the world;")
        , Line(text: "grant us your peace.", indent: 1, bold: true)
        ]
    );
  }
}
