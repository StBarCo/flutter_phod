import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phod/helpers/lesson.dart';
import 'package:flutter_phod/helpers/psalms.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';
import 'package:get/get.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_phod/models/calendar_day.dart';
import 'package:flutter_phod/controllers/liturgicalCalendarController.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/section_title.dart';
import 'package:flutter_phod/helpers/page_header.dart';

 LiturgicalCalendarController c = Get.put( LiturgicalCalendarController() );

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Calendar',
        body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            children: <Widget>[
              PageHeader(),
              Obx( () => selectedDayHeader(c.selected)),
              RenderLiturgicalCalendar( )
            ]
          )
      )
    );
  }
}

class RenderLiturgicalCalendar extends StatelessWidget {
  // RenderLitCalendar( this.now );
  // DateTime now;
  // LiturgicalCalendarController c = Get.put( LiturgicalCalendarController() );

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () => c.lastMonth(),
                    // c.setToday( c.today.value.addMonths(-1));
                  tooltip: ("Last Month"),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.blueAccent[700],
                    size: 24.0,
                  ),
                ),
                Obx( () => SectionTitle(text: c.month, center: true )),
                IconButton(
                  onPressed: () => c.nextMonth(),
                  tooltip: ("Next Month"),
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.blueAccent[700],
                    size: 24.0,
                  ),
                ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    onPressed: () { c.backToToday(); },
                    child: Text('Today')
                ),
                RaisedButton(
                    onPressed: () { c.nextAshWednesday(); },
                    child: Text('Next Ash Wednesday')
                ),
                RaisedButton(
                    onPressed: () { c.nextEaster(); },
                    child: Text('Next Easter')
                )
              ]
          ),

          // CalendarHeader( month.dayNames ),
          Obx( () => CalendarDays(c.calendar) ),
          Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Morning Prayer"),
                  onPressed: () => c.selectReadingFor("morningPrayer"),
                ),
                RaisedButton(
                  child: Text("Eucharist"),
                  onPressed: () => c.selectReadingFor("eucharist"),
                ),
                RaisedButton(
                  child: Text("Evening Prayer"),
                  onPressed: () => c.selectReadingFor("eveningPrayer"),
                )

              ]
          ),
          Obx( () => showReadingsFor( c.readingsFor ) ),
        ]
    );
  }
}

class CalendarDays extends StatelessWidget {

  CalendarDays( this.calendar );
  LiturgicalCalendar calendar;
  @override
  Widget build(BuildContext context) {
    int index = 0;
    int i = 0;
    List<TableRow> theseRows = [];
    List<CalendarDayModel> thisWeek = c.week(index);
    while ( thisWeek != null && thisWeek.length > 0 ) {
      //List<Day> thisWeek = c.days.getRange(index, index + 7).toList();
      theseRows.add( renderWeek( thisWeek ) );
      index += 1;
      thisWeek = c.week(index);
    }
    return Table(
      children: theseRows,
      defaultColumnWidth: FixedColumnWidth( 45.0 ),
      // children: weekRows(calendar)
    );
  }
}

List<TableRow> weekRows( LiturgicalCalendar calendar) {
  int index = 0;

}

TableRow renderWeek( List<CalendarDayModel> days ) {
  // List<Widget> theseDays = c.days.getRange(day1, day1 + 7).map<Widget>( (idx) {
  List<Widget> theseDays = days.map<Widget>( (d) {
    return TableCell(
      child: CalendarDayBox( d ),
    );
  }).toList();

  return TableRow(
      children: theseDays
  );
}

class CalendarDayBox extends StatelessWidget {
  CalendarDayBox(this.day);
  CalendarDayModel day;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Container(
        margin: EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () => {
            c.select(day),
          },
          child: Obx( () => DayContainer(day, c.selected) )
      )
      )
      );
  }
}

Container DayContainer( CalendarDayModel day, CalendarDayModel selected) {
  bool withBorder = day.day.now.isToday || (day == selected);
  return Container(
    height: 50.0,
    decoration: BoxDecoration(
      color:  day.day.season.colors[0],
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(5.0)),
      border: Border.all(
        color: withBorder ? Colors.black :  day.day.season.colors[0],
        width: withBorder ? 4 :  0
      ),
    ),
    child: Text("${ day.day.now.getDate}")
  );
}

TableRow calendarHeader( List<String> daynames) {
  List<Widget> theseDayNames = daynames.map<Widget>( (name) { return Text(name); }).toList();
  return TableRow( children: theseDayNames);
}

Column selectedDayHeader( CalendarDayModel thisDay) {
  String title = thisDay.day.season.title;
  int iweek = thisDay.day.season.week ?? 0;
  String week = (iweek > 0) ? "- Week $iweek " : "";
  String selectedDate = thisDay.day.now.format('yMMMMd');

  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text( "[ $selectedDate: $title $week]")
      ]
  );
}
Container showReadingsFor( String service ) {
  switch( service ) {
    case "morningPrayer": return Container( child: officeReadings('mp'));
    case "eveningPrayer": return Container( child: officeReadings('ep'));
    case "eucharist": return Container( child: eucharisticReadings());
    default: return Container( child: Text('Service Readings go here'));
  }
}

Column officeReadings(String office) {
  LiturgicalDay litDay = c.selected.day;
  litDay.service = office;
  return Column(
  children: <Widget>[
    Psalms( pss: DailyPsalms().getDailyPsalms(litDay, "30DayCycle") ),
    Lesson(litDay: litDay, lesson: 1),
    Lesson(litDay: litDay, lesson: 2),
    ]
  );
}

Column eucharisticReadings() {
  return Column(
    children: <Widget>[
      Text( 'Eucharistic Readings go here'),
      ]
  );
}