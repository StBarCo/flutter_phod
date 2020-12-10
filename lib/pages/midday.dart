import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_phod/helpers/psalms_pick_one.dart';
import 'package:flutter_phod/helpers/show_one_psalms.dart';
import 'package:flutter_phod/helpers/reusablePieces/word_of_the_lord.dart';
import 'package:flutter_phod/services/database.dart';
import 'package:flutter_phod/helpers/reusablePieces/gloria.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/reusablePieces/lord_have_mercy.dart';
import 'package:flutter_phod/helpers/reusablePieces/lords_prayer.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/stores/psalm_map.dart';

class Midday extends StatefulWidget {
  @override
  _MiddayState createState() => _MiddayState();
}

class _MiddayState extends State<Midday> {
  ScrollController _scrollController = new ScrollController();
  bool noAdditionalDirections = true;
  @override
  Widget build(BuildContext context) {
    print("NO ADD DIRS: $noAdditionalDirections");
    return IphodScaffold(
        context: context,
        title: 'Midday Prayer',
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        children: <Widget>[
            PageHeader(litDay: LitDay().init())
          , Versical( speaker: 'Officiant', text: 'O God, make speed to save us;')
          , Versical( speaker: 'People', text: 'O Lord, make haste to help us.', bold: true,)
          , Versical( speaker: 'Officiant', text: 'Glory be to the Father, and to the Son, and to the Holy Spirit;')
          , Versical( speaker: 'People', text: 'As it was in the beginning, is now, and ever shall be, world without end. Amen.', bold: true,)

          , Rubric( text: 'Except in Lent, add Alleluia.')
          , Rubric( text: 'A suitable hymn may be sung.')
          , Rubric( text: 'One or more of the following, or some other suitable Psalm, is sung or said.')

          , PsalmsPickOne( psalms:
            [ Ps(119, 105, 112)
            , Ps(121, 1, 999)
            , Ps(124, 1, 999)
            , Ps(126, 1, 999)
            ])
          , Rubric( text: 'At the end of the Psalms the Gloria Patri (Glory be...) is sung or said')
          , Gloria()

          , MiddayScripture()

          , Rubric( text: "A meditation, silent or spoken, may follow. The Officiant then begins the Prayers")

          , Versical( speaker: "Officiant", text: "I will bless the Lord at all times.")
          , Versical( speaker: "People", text: "His praise shall continually be in my mouth.", bold: true,)

          , LordHaveMercy()
          , LordsPrayer()

          , Versical( speaker: "Officiant", text: "O Lord, hear our prayer;")
          , Versical( speaker: "People", text: "And let our cry come to you.", bold: true,)
          , Versical( speaker: "Officiant", text: "Let us pray.")

          , Rubric( text: "The Officiant then says one or more of the following Collects. Other appropriate Collects may also be used.")
          , Paragraph( text: """
              Blessed Savior, at this hour you hung upon the Cross, stretching 
              out your loving arms: Grant that all the peoples of the earth may 
              look to you and be saved; for your tender mercies’ sake. Amen.
              """)
          , Paragraph( text: """
              Almighty Savior, who at mid-day called your servant Saint Paul to 
              be an apostle to the Gentiles: We pray you to illumine the world 
              with the radiance of your glory, that all nations may come and 
              worship you; for you live and reign with the Father and the Holy 
              Spirit, one God, for ever and ever. Amen.
              """)
          , Paragraph( text:  """
              Father of all mercies, you revealed your boundless compassion to 
              your apostle Saint Peter in a three-fold vision: Forgive our 
              unbelief, we pray, and so strengthen our hearts and enkindle our 
              zeal, that we may fervently desire the salvation of all people, 
              and diligently labor in the extension of your kingdom; through him 
              who gave himself for the life of the world, your Son our Savior 
              Jesus Christ. Amen.
              """)
          , Paragraph( text: """
              Pour your grace into our hearts, O Lord, that we who have known the
              incarnation of your Son Jesus Christ, announced by an angel to the 
              Virgin Mary, may by his Cross and passion be brought to the glory 
              of his resurrection; who lives and reigns with you, in the unity 
              of the Holy Spirit, one God, now and for ever. Amen.
              """)
          , Versical( speaker: "Officiant", text: "Let us bless the Lord.")
          , Versical( speaker: "People", text: "Thanks be to God.", bold: true)
          , Rubric( text: "From Easter Day through the Day of Pentecost, “Alleluia, alleluia” may be added to the preceding versicle and response.")

          , Rubric( text: "The Officiant may conclude with this, or one of the other concluding sentences from Morning and Evening Prayer.")

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
          , noAdditionalDirections ? Container() : Paragraph( text: """
              Other suitable selections from the Psalter include Psalms 19, 67, 
              one or more sections of Psalm 119, or a selection from Psalms 120 
              through 133. Either version of the Lord’s Prayer may be ended with, 
              “deliver us from evil. Amen.” omitting the concluding doxology.
              """)
        ],
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
            Rubric( text: 'One of the following, or some other suitable passage of Scripture, is read')
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
