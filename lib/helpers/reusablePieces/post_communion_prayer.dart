import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

import '../parts.dart';

class PostCommunionPrayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph(
        [ Rubric( text: "After Communion, the Minister says")
        , Line(text: "Almighty and everliving God,")
        , Line(text: "we thank you for feeding us, in these holy mysteries,", indent: 1, bold: true)
        , Line(text: "with the spiritual food of the most precious Body and Blood", indent: 1, bold: true)
        , Line(text: "of your Son our Savior Jesus Christ;", indent: 1, bold: true)
        , Line(text: "and for assuring us, through this Sacrament, of your favor and")
        , Line(text: "goodness towards us:", indent: 1, bold: true)
        , Line(text: "that we are true members of the mystical body of your Son,", indent: 1, bold: true)
        , Line(text: "the blessed company of all faithful people;", indent: 1, bold: true)
        , Line(text: "and are also heirs, through hope,", indent: 1, bold: true)
        , Line(text: "of your everlasting kingdom.", indent: 1, bold: true)
        , Line(text: "And we humbly ask you, heavenly Father,")
        , Line(text: "to assist us with your grace,", indent: 1, bold: true)
        , Line(text: "that we may continue in that holy fellowship,", indent: 1, bold: true)
        , Line(text: "and do all the good works that you have prepared for us to", indent: 1, bold: true)
        , Line(text: "walk in;", indent: 1, bold: true)
        , Line(text: "through Jesus Christ our Lord,", indent: 1, bold: true)
        , Line(text: "to whom, with you and the Holy Spirit,", indent: 1, bold: true)
        , Line(text: "be all honor and glory, now and for ever. Amen.", indent: 1, bold: true)
        ]
    );
  }
}
