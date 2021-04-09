import 'package:flutter/material.dart';
import 'package:legereme/helpers/rubric.dart';
import 'package:legereme/helpers/section_title.dart';

import 'line.dart';

class ApostlesCreed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          SectionTitle( text: "Apostles’ Creed" )
        , Rubric("Officiant and People together, all standing")
        , Line( text: "I believe in God, the Father almighty,")
        , Line( indent: true,  text: "creator of heaven and earth.")
        , Line( text: "I believe in Jesus Christ, his only Son, our Lord.")
        , Line( text: "He was conceived by the Holy Spirit")
        , Line( indent: true,  text: "and born of the Virgin Mary.")
        , Line( indent: true,  text: "He suffered under Pontius Pilate,")
        , Line( indent: true,  text: "was crucified, died, and was buried.")
        , Line( indent: true,  text: "He descended to the dead.")
        , Line( indent: true,  text: "On the third day he rose again.")
        , Line( indent: true,  text: "He ascended into heaven,")
        , Line( indent: true,  text: "and is seated at the right hand of the Father.")
        , Line( indent: true,  text: "He will come again to judge the living and the dead.")
        , Line( text: "I believe in the Holy Spirit,")
        , Line( indent: true,  text: "the holy catholic Church,")
        , Line( indent: true,  text: "the communion of saints,")
        , Line( indent: true,  text: "the forgiveness of sins,")
        , Line( indent: true,  text: "the resurrection of the body,")
        , Line( indent: true,  text: "and the life everlasting. Amen.")
      ],
    );
    
  }
}
