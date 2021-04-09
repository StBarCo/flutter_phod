import 'package:flutter/material.dart';
import 'package:legereme/helpers/iphod_scaffold.dart';
import 'package:legereme/helpers/paragraph.dart';
import 'package:legereme/helpers/section_title.dart';
import 'package:legereme/helpers/page_header.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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