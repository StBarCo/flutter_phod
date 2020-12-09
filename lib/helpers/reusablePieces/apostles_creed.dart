import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';


import '../parts.dart';

class ApostlesCreed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          ItemTitle( text: "Apostles’ Creed" )
        , Rubric( text: "Officiant and People together, all standing")
        , PhrasedParagraph([Line( text: "I believe in God, the Father almighty,")
        , Line( indent: 1, text:  "creator of heaven and earth.")
        , Line( text: "I believe in Jesus Christ, his only Son, our Lord.")
        , Line( text: "He was conceived by the Holy Spirit")
        , Line( indent: 1,  text: "and born of the Virgin Mary.")
        , Line( indent: 1,  text: "He suffered under Pontius Pilate,")
        , Line( indent: 1,  text: "was crucified, died, and was buried.")
        , Line( indent: 1,  text: "He descended to the dead.")
        , Line( indent: 1,  text: "On the third day he rose again.")
        , Line( indent: 1,  text: "He ascended into heaven,")
        , Line( indent: 1,  text: "and is seated at the right hand of the Father.")
        , Line( indent: 1,  text: "He will come again to judge the living and the dead.")
        , Line( text: "I believe in the Holy Spirit,")
        , Line( indent: 1,  text: "the holy catholic Church,")
        , Line( indent: 1,  text: "the communion of saints,")
        , Line( indent: 1,  text: "the forgiveness of sins,")
        , Line( indent: 1,  text: "the resurrection of the body,")
        , Line( indent: 1,  text: "and the life everlasting. Amen.")])
      ],
    );
    
  }
}
