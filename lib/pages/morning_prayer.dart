import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/opening_sentences.dart';
import 'package:flutter_phod/helpers/confession.dart';
import 'package:flutter_phod/helpers/psalms.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';

class MorningPrayer extends StatefulWidget {
  @override
  _MorningPrayerState createState() => _MorningPrayerState();
}

class _MorningPrayerState extends State<MorningPrayer> {
  final LitDay litDay = LitDay().init(service: 'mp');

  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Morning Prayer',
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          children: <Widget>[
              PageHeader(litDay: litDay)
            , Rubric(text: "The Officiant may begin Morning Prayer by reading an opening sentence of Scripture. One of the following, or a sentence from among those provided at the end of the Office (pages 27-29), is customary.")
            , OpeningSentences(litDay: litDay)
            , Confession()
            , Rubric(text: 'Then follows the psalm or psalms appointed')
            , Psalms( pss: DailyPsalms().getDailyPsalms(litDay, "30DayCycle") )
          ],
        )
    );
  }
}
