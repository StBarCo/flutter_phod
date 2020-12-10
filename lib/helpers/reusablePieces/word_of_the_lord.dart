import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/parts.dart';

class WordOfTheLord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph(content: [
          Rubric( text: "At the end of the reading is said")
        , Versical( speaker: "", text: "The Word of the Lord.")
        , Versical( speaker: "People", text: "Thanks be to God.", bold: true,)
        ]
    );
  }
}
