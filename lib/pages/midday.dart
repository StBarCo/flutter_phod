import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:legereme/helpers/psalms_pick_one.dart';
import 'package:legereme/helpers/word_of_the_lord.dart';
import 'package:legereme/helpers/gloria.dart';
import 'package:legereme/helpers/iphod_scaffold.dart';
import 'package:legereme/helpers/lord_have_mercy.dart';
import 'package:legereme/helpers/lords_prayer.dart';
import 'package:legereme/helpers/paragraph.dart';
import 'package:legereme/helpers/rubric.dart';
import 'package:legereme/helpers/scripture_ref.dart';
import 'package:legereme/helpers/versical.dart';
import 'package:legereme/helpers/page_header.dart';
import 'package:legereme/models/psalm_model.dart';

class Midday extends StatefulWidget {
  @override
  _MiddayState createState() => _MiddayState();
}

class _MiddayState extends State<Midday> {
  ScrollController _scrollController = new ScrollController();
  bool noAdditionalDirections = true;
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Midday Prayer',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        children: <Widget>[
            PageHeader()
          , Versical( speaker: 'Officiant', says: 'O God, make speed to save us;')
          , Versical( speaker: 'People', says: 'O Lord, make haste to help us.')
          , Versical( speaker: 'Officiant', says: 'Glory be to the Father, and to the Son, and to the Holy Spirit;')
          , Versical( speaker: 'People', says: 'As it was in the beginning, is now, and ever shall be, world without end. Amen.')

          , Rubric('Except in Lent, add Alleluia.')
          , Rubric('A suitable hymn may be sung.')
          , Rubric('One or more of the following, or some other suitable Psalm, is sung or said.')

          , PsalmsPickOne( psalms:
            [ Ps(119, 105, 112)
            , Ps(121, 1, 999)
            , Ps(124, 1, 999)
            , Ps(126, 1, 999)
            ])
          , Rubric('At the end of the Psalms the Gloria Patri (Glory be...) is sung or said')
          , Gloria()

          , MiddayScripture()

          , Rubric("A meditation, silent or spoken, may follow. The Officiant then begins the Prayers")

          , Versical( speaker: "Officiant", says: "I will bless the Lord at all times.")
          , Versical( speaker: "People", says: "His praise shall continually be in my mouth.")

          , LordHaveMercy()
          , LordsPrayer()

          , Versical( speaker: "Officiant", says: "O Lord, hear our prayer;")
          , Versical( speaker: "People", says: "And let our cry come to you.")
          , Versical( speaker: "Officiant", says: "Let us pray.")

          , Rubric("The Officiant then says one or more of the following Collects. Other appropriate Collects may also be used.")
          , Paragraph( """
              Blessed Savior, at this hour you hung upon the Cross, stretching 
              out your loving arms: Grant that all the peoples of the earth may 
              look to you and be saved; for your tender mercies’ sake. Amen.
              """)
          , Paragraph( """
              Almighty Savior, who at mid-day called your servant Saint Paul to 
              be an apostle to the Gentiles: We pray you to illumine the world 
              with the radiance of your glory, that all nations may come and 
              worship you; for you live and reign with the Father and the Holy 
              Spirit, one God, for ever and ever. Amen.
              """)
          , Paragraph(  """
              Father of all mercies, you revealed your boundless compassion to 
              your apostle Saint Peter in a three-fold vision: Forgive our 
              unbelief, we pray, and so strengthen our hearts and enkindle our 
              zeal, that we may fervently desire the salvation of all people, 
              and diligently labor in the extension of your kingdom; through him 
              who gave himself for the life of the world, your Son our Savior 
              Jesus Christ. Amen.
              """)
          , Paragraph( """
              Pour your grace into our hearts, O Lord, that we who have known the
              incarnation of your Son Jesus Christ, announced by an angel to the 
              Virgin Mary, may by his Cross and passion be brought to the glory 
              of his resurrection; who lives and reigns with you, in the unity 
              of the Holy Spirit, one God, now and for ever. Amen.
              """)
          , Versical( speaker: "Officiant", says: "Let us bless the Lord.")
          , Versical( speaker: "People", says: "Thanks be to God.")
          , Rubric("From Easter Day through the Day of Pentecost, “Alleluia, alleluia” may be added to the preceding versicle and response.")

          , Rubric("The Officiant may conclude with this, or one of the other concluding sentences from Morning and Evening Prayer.")

          , ScriptureRef(
              text: "The grace of our Lord Jesus Christ, and the love of God, and the fellowship of the Holy Spirit, be with us all evermore. Amen."
            , ref: "2 Corinthians 13:14t"
            )
          , RaisedButton(
                onPressed: () { setState(() {
                  noAdditionalDirections = !noAdditionalDirections;
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                }); }
              , child: Text('Additional Directions')
            )
          , noAdditionalDirections ? Container() : Paragraph( """
              Other suitable selections from the Psalter include Psalms 19, 67, 
              one or more sections of Psalm 119, or a selection from Psalms 120 
              through 133. Either version of the Lord’s Prayer may be ended with, 
              “deliver us from evil. Amen.” omitting the concluding doxology.
              """)
        ],
      )
      )
    );
  }
}

class MiddayScripture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            Rubric('One of the following, or some other suitable passage of Scripture, is read')
        , SizedBox(height: 14.0)
        , ScriptureRef(
          text: "Jesus said, “Now is the judgment of this world; now will the ruler of this world be cast out. And I, when I am lifted up from the earth, will draw all people to myself.”"
        , ref: "John 12:31-32"
        )
        , SizedBox(height: 14.0)
        , ScriptureRef(
          text: "If anyone is in Christ, he is a new creation. The old has passed away; behold, the new has come. All this is from God, who through Christ reconciled us to himself and gave us the ministry of reconciliation."
        , ref: "2 Corinthians 5:17-18"
        )
        , SizedBox(height: 14.0)
        , ScriptureRef(
          text: "From the rising of the sun to its setting my name will be great among the nations, and in every place incense will be offered to my name, and a pure offering. For my name will be great among the nations, says the Lord of Hosts."
         , ref: "Malachi 1:11"
        )
        , SizedBox(height: 14.0)
        , WordOfTheLord()
        ]
    );
  }
}
