import 'package:flutter/material.dart';
import 'package:flutter_phod/stores/season.dart';
import 'package:intl/intl.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/parts.dart';

class PageHeader extends StatelessWidget {
  LitDay litDay;
  PageHeader({Key key, this.litDay}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          SectionTitle(
              text: DateFormat.MMMMEEEEd().format(litDay.now),
            center: true,
            leadingSpace: 15,
            // style: TextStyle(
            //   fontSize: 20.0,
            //   letterSpacing: 2
            // )
          ),
          SeasonTitle(litDay.season, litDay.litYear)
        ],
      ),
    );
  }
}

class SeasonTitle extends StatelessWidget {
  SeasonTitle(this.season, this.litYear);
  final Season season;
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
    return Expanded(
      child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
              ItemTitle( text: "Season following Pentecost", center: true,)
            , ItemTitle(text:"Proper $week$litYear", center: true, leadingSpace: 0,)
      ]
      ),
    );
  }
}

class OtherTitle extends StatelessWidget {
  OtherTitle(this.season, this.litYear);
  final Season season;
  final String litYear;
  Widget build(BuildContext context) {
    String week;
    if (season.week == null) { week = ""; }
    else if (season.week == 0) { week = litYear; }
    else if (season.week > 0) { week = "${season.week}$litYear";}
    String title = "${season.title}  $week";
    return ItemTitle( text: title, center: true, leadingSpace: 0,);
  }
}

