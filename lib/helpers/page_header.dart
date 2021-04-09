import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legereme/controllers/liturgicalCalendarController.dart';
import 'package:legereme/models/liturgical_season.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:legereme/models/liturgical_day.dart';

LiturgicalCalendarController c = Get.put( LiturgicalCalendarController());

class PageHeader extends StatelessWidget {
  LiturgicalDay litDay = c.selectedDay.litDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
            DateFormat.MMMMEEEEd().format(litDay.now),
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2
          )
        ),
        SeasonTitle(litDay.season, litDay.litYear)
      ],
    );
  }
}

class SeasonTitle extends StatelessWidget {
  SeasonTitle(this.season, this.litYear);
  final LiturgicalSeason season;
  final String litYear;
  Widget build(BuildContext context) {
    return (season.id == 'proper') ? ProperTitle(season.week, litYear) : OtherTitle(season, litYear);
  }
}

class ProperTitle extends StatelessWidget {
  ProperTitle(this.week, this.litYear);
  final int week;
  final String litYear;
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center
      , children: <Widget>[
            Text(
                "Season following Pentecost"
                , style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2
                  )
            )
          , Text("Proper $week$litYear")
    ]
    );
  }
}

class OtherTitle extends StatelessWidget {
  OtherTitle(this.season, this.litYear);
  final LiturgicalSeason season;
  final String litYear;
  Widget build(BuildContext context) {
    String week;
    if (season.week == null) { week = ""; }
    else if (season.week == 0) { week = litYear; }
    else if (season.week > 0) { week = "${season.week}$litYear";}
    String title = "${season.title}  $week";
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center
        , children: <Widget>[
      Text(
          title
          , style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 2
      )
      )
    ]
    );
  }
}

