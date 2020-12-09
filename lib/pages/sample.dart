import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/psalms_pick_one.dart';
import 'package:flutter_phod/helpers/reusablePieces/gloria.dart';
import 'package:flutter_phod/helpers/reusablePieces/lord_have_mercy.dart';
import 'package:flutter_phod/helpers/reusablePieces/lords_prayer.dart';
import 'package:flutter_phod/stores/psalm_map.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        context: context,
        title: 'Sample Page',
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          children: <Widget>[
            _sampleStyles(context),


            // PageHeader(litDay: LitDay().init())
            Versical(
                speaker: 'Officiant', text: 'O God, make speed to save us;'),
            Versical(speaker: 'People', text: 'O Lord, make haste to help us.'),
            Versical(
                speaker: 'Officiant',
                text:
                    'Glory be to the Father, and to the Son, and to the Holy Spirit;'),
            Versical(
                speaker: 'People',
                text:
                    'As it was in the beginning, is now, and ever shall be, world without end. Amen.'),
            Rubric(text: 'Except in Lent, add Alleluia.'),
            Rubric(text: 'A suitable hymn may be sung.'),
            Rubric(
                text:
                    'One or more of the following, or some other suitable Psalm, is sung or said.'),
            PsalmsPickOne(psalms: [
              Ps(119, 105, 112),
              Ps(121, 1, 999),
              Ps(124, 1, 999),
              Ps(126, 1, 999)
            ]),
            Rubric(
                text:
                    'At the end of the Psalms the Gloria Patri (Glory be...) is sung or said'),
            Gloria(),
            Rubric(
                text:
                    "A meditation, silent or spoken, may follow. The Officiant then begins the Prayers"),
            Versical(
                speaker: "Officiant",
                text: "I will bless the Lord at all times."),
            Versical(
                speaker: "People",
                text: "His praise shall continually be in my mouth."),
            LordHaveMercy(),
            LordsPrayer(),
            Versical(speaker: "Officiant", text: "O Lord, hear our prayer;"),
            Versical(speaker: "People", text: "And let our cry come to you."),
            Versical(speaker: "Officiant", text: "Let us pray."),
            Rubric(
                text:
                    "The Officiant then says one or more of the following Collects. Other appropriate Collects may also be used."),
            Paragraph(text: """
              Blessed Savior, at this hour you hung upon the Cross, stretching 
              out your loving arms: Grant that all the peoples of the earth may 
              look to you and be saved; for your tender mercies’ sake. Amen.
              """),
            Paragraph(text: """
              Almighty Savior, who at mid-day called your servant Saint Paul to 
              be an apostle to the Gentiles: We pray you to illumine the world 
              with the radiance of your glory, that all nations may come and 
              worship you; for you live and reign with the Father and the Holy 
              Spirit, one God, for ever and ever. Amen.
              """),
            Paragraph(text: """
              Father of all mercies, you revealed your boundless compassion to 
              your apostle Saint Peter in a three-fold vision: Forgive our 
              unbelief, we pray, and so strengthen our hearts and enkindle our 
              zeal, that we may fervently desire the salvation of all people, 
              and diligently labor in the extension of your kingdom; through him 
              who gave himself for the life of the world, your Son our Savior 
              Jesus Christ. Amen.
              """),
            Paragraph(text: """
              Pour your grace into our hearts, O Lord, that we who have known the
              incarnation of your Son Jesus Christ, announced by an angel to the 
              Virgin Mary, may by his Cross and passion be brought to the glory 
              of his resurrection; who lives and reigns with you, in the unity 
              of the Holy Spirit, one God, now and for ever. Amen.
              """),
            Versical(speaker: "Officiant", text: "Let us bless the Lord."),
            Versical(speaker: "People", text: "Thanks be to God."),
            Rubric(
                text:
                    "From Easter Day through the Day of Pentecost, “Alleluia, alleluia” may be added to the preceding versicle and response."),
            Rubric(
                text:
                    "The Officiant may conclude with this, or one of the other concluding sentences from Morning and Evening Prayer."),
            ScriptureRef(
                text:
                    "The grace of our Lord Jesus Christ, and the love of God, and the fellowship of the Holy Spirit, be with us all evermore. Amen.",
                ref: "2 Corinthians 13:14t")
          ],
        ));
  }

  Column _sampleStyles(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Headline1",
            style: Theme.of(context).textTheme.headline2.apply(color: Colors.blue[800]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Headline2",
            style: Theme.of(context).textTheme.headline2.apply(color: Theme.of(context).primaryColorDark),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Headline3",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Headline4",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Headline5 - large text in dialogs",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Headline6 - primary text appbars & dialogs",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Subtitle1: Primary text in lists",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Body 1 Used for emphasizing text that would otherwise be bodyText2.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Body 2 The default text style for Material. ",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Caption: Used for auxiliary text associated with images. ",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "button: Used for text on ElevatedButton, TextButton and OutlinedButton. ",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Subtitle2: Medium emphasis text that's a little smaller than subtitle1",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "overline: The smallest style. [...]",
            style: Theme.of(context).textTheme.overline,
          ),
        ),
      ],
    );
  }
}
