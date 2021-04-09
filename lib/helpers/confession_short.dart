import 'package:flutter/material.dart';
import 'package:legereme/helpers/line.dart';

class ConfessionShort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>
        [ Line( text: "Most merciful God,")
        , Line( text: "we confess that we have sinned against you", indent: true)
        , Line( text: "in thought, word and deed,", indent: true)
        , Line( text: "by what we have done, and by what we have left undone.", indent: true)
        , Line( text: "We have not loved you with our whole heart;")
        , Line( text: "we have not loved our neighbors as ourselves.", indent: true)
        , Line( text: "We are truly sorry and we humbly repent.")
        , Line( text: "For the sake of your Son Jesus Christ,")
        , Line( text: "have mercy on us and forgive us;", indent: true)
        , Line( text: "that we may delight in your will, and walk in your ways,", indent: true)
        , Line( text: "to the glory of your Name. Amen.", indent: true)
        ]
    );
  }
}








