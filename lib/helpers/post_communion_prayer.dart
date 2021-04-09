import 'package:flutter/material.dart';
import 'package:legereme/helpers/rubric.dart';

import 'line.dart';

class PostCommunionPrayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>
        [ Rubric("After Communion, the Minister says")
        , Line(text: "Almighty and everliving God,")
        , Line(text: "we thank you for feeding us, in these holy mysteries,", indent: true, bold: true)
        , Line(text: "with the spiritual food of the most precious Body and Blood", indent: true, bold: true)
        , Line(text: "of your Son our Savior Jesus Christ;", indent: true, bold: true)
        , Line(text: "and for assuring us, through this Sacrament, of your favor and")
        , Line(text: "goodness towards us:", indent: true, bold: true)
        , Line(text: "that we are true members of the mystical body of your Son,", indent: true, bold: true)
        , Line(text: "the blessed company of all faithful people;", indent: true, bold: true)
        , Line(text: "and are also heirs, through hope,", indent: true, bold: true)
        , Line(text: "of your everlasting kingdom.", indent: true, bold: true)
        , Line(text: "And we humbly ask you, heavenly Father,")
        , Line(text: "to assist us with your grace,", indent: true, bold: true)
        , Line(text: "that we may continue in that holy fellowship,", indent: true, bold: true)
        , Line(text: "and do all the good works that you have prepared for us to", indent: true, bold: true)
        , Line(text: "walk in;", indent: true, bold: true)
        , Line(text: "through Jesus Christ our Lord,", indent: true, bold: true)
        , Line(text: "to whom, with you and the Holy Spirit,", indent: true, bold: true)
        , Line(text: "be all honor and glory, now and for ever. Amen.", indent: true, bold: true)
        ]
    );
  }
}
