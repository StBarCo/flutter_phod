import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

class ConfessionShort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph( content:
        [ Line( text: "Most merciful God,")
        , Line( text: "we confess that we have sinned against you", indent: 1)
        , Line( text: "in thought, word and deed,", indent: 1)
        , Line( text: "by what we have done, and by what we have left undone.", indent: 1)
        , Line( text: "We have not loved you with our whole heart;")
        , Line( text: "we have not loved our neighbors as ourselves.", indent: 1)
        , Line( text: "We are truly sorry and we humbly repent.")
        , Line( text: "For the sake of your Son Jesus Christ,")
        , Line( text: "have mercy on us and forgive us;", indent: 1)
        , Line( text: "that we may delight in your will, and walk in your ways,", indent: 1)
        , Line( text: "to the glory of your Name. Amen.", indent: 1)
        ]
    );
  }
}








