import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_app_bar.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/paragraph.dart';
import 'package:flutter_phod/helpers/section_title.dart';
// import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

import 'package:petitparser/petitparser.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vss =
    ( digit().plus()
        .seq(char(':').seq(digit().plus()).optional()
          .seq(char('-').seq(digit().plus()).optional())
        )
    ).flatten().plus();

    final book =  ((char('1') | char('2') | char('3')).star() & (letter() | char(' ')).plus()).flatten().seq(char(':'));
    return IphodScaffold(
      title: 'About',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          children: <Widget>[
            PageHeader(),
            SectionTitle(text: "From Whence Cometh..."),
            Text("PARSE: ${vss.matchesSkipping("3 song of solomon 15:1-10, 16:1")}"),
            Paragraph("""
              The Legereme app is a ministry of St. Elizabeth's Anglican Mission, 
              a member of the ACNA Anglican Diocese of Pittsburgh. 
            """),
            Paragraph( """
              The development team consists of the Rector (aka "Me"). No one else should be held 
              responsible for any errors or omissions.
              """),
            Paragraph( """
              The Anglican Diocese of Pittsburgh and the Anglican Church of North America, while supportive,
              are not responsible.
            """),
            SectionTitle( text: "What's Here?"),
            Paragraph( """
              Most of the 2019 Book of Common Prayer - except for the eucharistic and 
              episcopal service. The Psalter is included. The app endeavors to be faithful
              to BCP 2019 in content and intent, but inerrancy is in no way guaranteed. 
              This is not the authoritative version.
              """),
            SectionTitle( text: "Scripture"),
            Paragraph( """
              Scripture is taken from three sources: The Psalms come from the 2019 BCP. 
              Mostly the rest of Scripture comes from the English Standard Version from 
              Crossway, a ministry of Good News Publishing. When the ESV text is not available
              (for whatever reason) the texts come from the World English Bible.
            """)
          ],
        ),
      )
    );
  }
}
// TODO Implement this library.