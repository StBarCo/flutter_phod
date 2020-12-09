import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

import '../parts.dart';

class ApostlesCreed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionTitle(text: "Apostles’ Creed"),
        Rubric(text: "Officiant and People together, all standing"),
        PhrasedParagraph([
          Line(text: "I believe in God, the Father almighty,", bold: true,),
          Line(indent: 1, text: "creator of heaven and earth.", bold: true,),
          Line(text: "I believe in Jesus Christ, his only Son, our Lord.", bold: true,),
          Line(text: "He was conceived by the Holy Spirit", bold: true,),
          Line(indent: 1, text: "and born of the Virgin Mary.", bold: true,),
          Line(indent: 1, text: "He suffered under Pontius Pilate,", bold: true,),
          Line(indent: 2, text: "was crucified, died, and was buried.", bold: true,),
          Line(indent: 1, text: "He descended to the dead.", bold: true,),
          Line(indent: 1, text: "On the third day he rose again.", bold: true,),
          Line(indent: 1, text: "He ascended into heaven,", bold: true,),
          Line(
              indent: 2,
              text: "and is seated at the right hand of the Father.", bold: true,),
          Line(
              indent: 1,
              text: "He will come again to judge the living and the dead.", bold: true,),
          Line(text: "I believe in the Holy Spirit,", bold: true,),
          Line(indent: 1, text: "the holy catholic Church,", bold: true,),
          Line(indent: 1, text: "the communion of saints,", bold: true,),
          Line(indent: 1, text: "the forgiveness of sins,", bold: true,),
          Line(indent: 1, text: "the resurrection of the body,", bold: true,),
          Line(indent: 1, text: "and the life everlasting. Amen.", bold: true,)
        ])
      ],
    );
  }
}
