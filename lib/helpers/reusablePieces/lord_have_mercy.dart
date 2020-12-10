import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

class LordHaveMercy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph( content:
      [
       Line(text: "Lord, have mercy [upon us].")
      , Line(text:"Christ, have mercy [upon us].", bold: true, indent: 1,)
        , Line(text:"Lord, have mercy [upon us].")
      ],
      leadingSpace: 15,
      trailingSpace: 0,

    );
  }
}
