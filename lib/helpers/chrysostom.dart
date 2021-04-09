import 'package:flutter/material.dart';
import 'package:legereme/helpers/paragraph.dart';
import 'package:legereme/helpers/section_title.dart';

class Chrysostom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        SectionTitle(text: "A Prayer Of St. John Chrysostom"),
        Paragraph( """
        Almighty God, you have given us grace at this time, with one accord 
        to make our common supplications to you; and you have promised through 
        your well-beloved Son that when two or three are gathered together in his 
        Name you will grant their requests: Fulfill now, O Lord, our desires 
        and petitions as may be best for us; granting us in this world knowledge of 
        your truth, and in the age to come life everlasting. Amen.
        """)
    ]
    );
  }
}
