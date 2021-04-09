import 'package:dart_date/dart_date.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:legereme/helpers/section_title.dart';
import 'package:legereme/stores/litday.dart';

class Day {
  bool isSelectable = true;
  int index;
  bool isSelectedDay = false;
  bool isToday = false;
  bool isPrevMonthDay = false;
  TextStyle textStyle;
  bool isNextMonthDay = false;
  bool isThisMonthDay = true;
  LitDay day;

  Day init( DateTime today, DateTime now, int index ) {
    int thisMonthDiff = diffMonth(today, now);
    this.isSelectable = true;
    this.index = index;
    this.isSelectedDay = false;
    this.isToday = (today == now);
    this.isPrevMonthDay = thisMonthDiff > 0;
    this.isNextMonthDay = thisMonthDiff < 0;
    this.isThisMonthDay = thisMonthDiff == 0;
    this.day = LitDay().init(now: now);
    return this;

  }
}

class CalendarController extends GetxController{
  var today = DateTime.now().obs;
  var selectedDay = 0.obs;
  var readingsFor = ''.obs ;
  var days = List<Day>().obs;
  var monthName = ''.obs;
  var dayNames = ["Sun", "Mon", "Tues", "Wed", "Thr", "Fri", "Sat"];
  setToday(now) { today.value = now; }
  setSelectedDay( index ) { selectedDay.value = index; }
  setDays(now) {
    DateTime thisDay = startOfMonth(now); // first day to display
    DateTime last = lastOfMonth(now); // now.endOfMonth.endOfWeek.addDays(7);
    List<Day> theseDays = [];
    monthName.value = dateTimeFormat(now, "MMMM");
    int index = 0;
    while (thisDay <= last) {
      theseDays.add( Day().init(now, thisDay, index) );
      if (isSameDay(thisDay, now)) {
        today.value = thisDay;// setToday( thisDay );
        selectedDay.value = index;
      }
    index += 1;
    thisDay = nextDay(thisDay);
  }
  days = theseDays;
  }

  setMonthName() { monthName.value = dateTimeFormat( today.value, "MMMM"); }
}

DateTime startOfMonth( DateTime now ) => (now.startOfMonth.isSunday) ? now.startOfMonth.nextDay : now.startOfMonth.startOfWeek;
DateTime lastOfMonth( DateTime now ) => now.endOfMonth.endOfWeek.addDays(7);
DateTime nextDay( DateTime now ) => now.nextDay;
String dateTimeFormat( DateTime now, String format) => now.format(format);
bool isSameDay( DateTime now, DateTime other) => now.isSameDay(other);

int diffMonth( DateTime today, DateTime now ) {
  int diff = today.getMonth - now.getMonth;
  if (diff == 0) return 0;
  // diff > 0 when now is last month except when today is in December
  if (diff > 0) return (today.getMonth == 12) ? -1 : 1;
  // diff < 0 when now is next month except when today is in January
  if (diff < 0) return (today.getMonth == 1) ? 1 : -1;
}

class RenderLitCalendar extends StatelessWidget {
  // RenderLitCalendar( this.now );
  // DateTime now;
  final CalendarController c = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    // Month month = Month().init( c.today.value );
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  // c.setToday( c.today.value.addMonths(-1));
                  c.setDays( c.today.value.addMonths(-1) ); },
                tooltip: ("Last Month"),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.blueAccent[700],
                  size: 24.0,
                ),
              ),
              SectionTitle(text: c.today.value.format("MMMM"), center: true ),
              IconButton(
                onPressed: () {
                  // c.setToday( c.today.value.addMonths(1));
                  c.setDays( c.today.value.addMonths(1));
                  },
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
                  onPressed: () {},
                  child: Text('Next Ash Wednesday')
              ),
              RaisedButton(
                  onPressed: () {},
                  child: Text('Next Easter')
              )
            ]
        ),

        // CalendarHeader( month.dayNames ),
        CalendarDays(),
        Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            RaisedButton(
              child: Text("Morning Prayer"),
              onPressed: () {print("Pressed Morning Prayer"); },
            ),
            RaisedButton(
              child: Text("Eucharist"),
              onPressed: () { print("Pressed Eucharist"); },
            ),
          RaisedButton(
            child: Text("Evening Prayer"),
            onPressed: () { print("Pressed Evening Prayer"); },
          )

        ]

        )
      ]
    );
  }
}

class CalendarDays extends StatelessWidget {
  final CalendarController c = Get.put(CalendarController());

  // CalendarDays( this.now );
  // DateTime now;
  @override
  Widget build(BuildContext context) {
    int index = 0;
    List<TableRow> theseRows = [];
    while ( index < c.days.length - 1) {
      //List<Day> thisWeek = c.days.getRange(index, index + 7).toList();
      theseRows.add( renderWeek( index ) );
      // weeks.add( widget.days.getRange(index, index + 6) );
      index += 7;
    }
    // theseRows.addAll( weeks.map<TableRow>( (w) => renderWeek( w )).toList() );
    return Table(
      children: theseRows,
      defaultColumnWidth: FixedColumnWidth( 45.0 ),
    );
  }
}

TableRow renderWeek( int day1 ) {
  final CalendarController c = Get.put( CalendarController() );
  // List<Widget> theseDays = c.days.getRange(day1, day1 + 7).map<Widget>( (idx) {
  List<Widget> theseDays = List<int>.generate(7, (day1) => day1 + 1).map<Widget>( (idx) {

    return TableCell(
      child: InkWell(
        onTap: () {
          c.setSelectedDay(  idx );
        },
        child: CalendarDayBox( idx )
      ),
    );
  }).toList();

  return TableRow(
        children: theseDays
    );
}

class CalendarDayBox extends StatelessWidget {
  CalendarDayBox(this.idx);
  int idx;
  final CalendarController c = Get.put( CalendarController() );
  @override
  Widget build(BuildContext context) {
    Day thisDay = c.days[idx];
    LitDay litDay = thisDay.day;
    return SizedBox(
      height: 50.0,
      child: Container(
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color:  litDay.season.colors[0],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
          border: Border.all(
              color: ( idx ==  thisDay.index ) ? Colors.black :  litDay.season.colors[0],
              width: ( idx ==  thisDay.index ) ? 4 :  0),
        ),
        child: Obx( () => Text("${ litDay.now.getDate}")),
      ),
    );
  }
}


TableRow calendarHeader( List<String> daynames) {
  List<Widget> theseDayNames = daynames.map<Widget>( (name) { return Text(name); }).toList();
  return TableRow( children: theseDayNames);
}





