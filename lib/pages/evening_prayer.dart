import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/ep_versicals.dart';
import 'package:flutter_phod/helpers/invitatory.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/scripture_ref.dart';
import 'package:flutter_phod/helpers/section_title.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/opening_sentences.dart';
import 'package:flutter_phod/helpers/confession.dart';
import 'package:flutter_phod/helpers/psalms.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';
import 'package:flutter_phod/helpers/lesson.dart';
import 'package:flutter_phod/helpers/canticle.dart';
import 'package:flutter_phod/helpers/apostles_creed.dart';
import 'package:flutter_phod/helpers/versical.dart';
import 'package:flutter_phod/helpers/lords_prayer.dart';
import 'package:flutter_phod/helpers/lord_have_mercy.dart';
import 'package:flutter_phod/helpers/collect.dart';
import 'package:flutter_phod/helpers/collect_for_mission.dart';
import 'package:flutter_phod/helpers/general_thanksgiving.dart';
import 'package:flutter_phod/helpers/chrysostom.dart';


class EveningPrayer extends StatefulWidget {
  @override
  _EveningPrayerState createState() => _EveningPrayerState();
}

class _EveningPrayerState extends State<EveningPrayer> {
  final LitDay litDay = LitDay().init(service: 'ep');

  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Evening Prayer',
        body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          children: <Widget>[
            PageHeader(litDay: litDay)
            , Rubric("The Officiant may begin Evening Prayer by reading an opening sentence of Scripture. One of the following, or a sentence from among those provided at the end of the Office (pages 54-56), is customary.")
            , OpeningSentences(litDay: litDay)
            , Confession()
            , Rubric('Then follows the psalm or psalms appointed')
            , Psalms( pss: DailyPsalms().getDailyPsalms(litDay, "30DayCycle") )
            , SectionTitle(text: 'The Lessons')
            , Lesson(litDay: litDay, lesson: 1)
            , Canticle(litDay: litDay, lesson: 1)
            , Lesson(litDay: litDay, lesson: 2)
            , Canticle(litDay: litDay, lesson: 2)
            , ApostlesCreed()
            , SectionTitle(text: 'The Prayers')
            , Versical( speaker: 'Officient', says: 'The Lord be with you.')
            , Versical( speaker: "People", says: "And with your spirit.")
            , Versical( speaker: "Officiant", says: "Let us pray.")
            , Rubric( "The People kneel or stand.")
            , LordHaveMercy()
            , LordsPrayer()
            , EPVersicals()
            , Rubric("The Officiant then prays one or more of the following Collects, always beginning with the Collect of the Day (the Collect of the Sunday or Principal Feast and of any of the weekdays following, or of the Holy Day being observed), found on pages 598-640. It is traditional to pray the Collects for Peace and Grace daily.")
            , Rubric("Alternatively, one may pray the Collects on a weekly rotation, using the suggestions in italics.")
            , SectionTitle( text: "From The Collects Of The Christian Year")
            , Collect( litDay: litDay, ofType: "week")
            , SectionTitle( text: "The Collect Of The Day")
            , Collect( litDay: litDay, ofType: "day")
            , Collect( litDay: litDay, ofType: "EPpeace")
            , Collect( litDay: litDay, ofType: "perils")
            , CollectForMission(litDay: litDay)
            , Rubric("The Officiant may invite the People to offer intercessions and thanksgivings. A hymn or anthem may be sung.")
            // <button on:click={ () => showPrayerList = !showPrayerList} >Prayer List</button>
            // {#if showPrayerList} <PrayerList ) {/if}

            , Rubric("Before the close of the Office one or both of the following prayers may be used.")
            , GeneralThanksgiving()
            , Chrysostom()
            , Versical( speaker: "Officiant", says: "Let us bless the Lord.")
            , Versical( speaker: "People", says: "Thanks be to God.")
            , Rubric("From Easter Day through the Day of Pentecost, “Alleluia, alleluia” may be added to the preceding versicle and response.")
            , Rubric("The Officiant says one of these concluding sentences (and the People may be invited to join)")
            , ScriptureRef(
                text: "The grace of our Lord Jesus Christ, and the love of God, and the fellowship of the Holy Spirit, be with us all evermore. Amen.",
                ref: "2 Corinthians 13:14t"
            )
            , ScriptureRef(
                text: "May the God of hope fill us with all joy and peace in believing through the power of the Holy Spirit. Amen.",
                ref: "Romans 15:13t"
            )
            , ScriptureRef(
                text: "Glory to God whose power, working in us, can do infinitely more than we can ask or imagine: Glory to him from generation to generation in the Church, and in Christ Jesus for ever and ever. Amen.",
                ref: "Ephesians 3:20-21t"
            )
          ],
        )
        )
    );
  }
}
