import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/section_title.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show defaultDayContainer;
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // CalendarController _controller;
  LitDay litDay = LitDay().init();
  @override
//  initState() {
//    super.initState();
//    _controller = CalendarController();
//  }
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Calendar',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            PageHeader(litDay: LitDay().init())
          , CalendarCarousel(
              onDayPressed: (date, events) {
                setState(() {
                  litDay = LitDay().init(now: date);
                });
                print('LITDAY COLLORS: ${litDay.season.colors}');
              }
              , customDayBuilder: (
                    bool isSelectable
                  , int index
                  , bool isSelectedDay
                  , bool isToday
                  , bool isPrevMonthDay
                  , TextStyle textStyle
                  , bool isNextMonthDay
                  , bool isThisMonthDay
                  , DateTime day
                ) {
                  LitDay thisLitDay = LitDay().init(now: day);
                  Color liturgicalColor;
                  switch(thisLitDay.season.colors[0]) {
                    case 'green': liturgicalColor = Colors.green; break;
                    case 'red': liturgicalColor = Colors.red; break;
                    case 'white':
                    case 'gold': liturgicalColor = Colors.yellow; break;
                    case 'purple': liturgicalColor = Colors.purple; break;
                    case 'blue': liturgicalColor = Colors.blue; break;
                    case 'rose': liturgicalColor = Colors.pinkAccent; break;
                    default: liturgicalColor = Colors.orange;
                  }
                  return IphodDay(
                        liturgicalColor
                      , isSelectable
                      , index
                      , isSelectedDay
                      , isToday
                      , isPrevMonthDay
                      , textStyle
                      , isNextMonthDay
                      , isThisMonthDay
                      , day
                    );
                    // return Center(
                    //  child: Icon(Icons.local_airport),
                    //);
          }



              , weekFormat: false
              // , markedDatesMap: _markedDateMap // List<Events>
              , height: 420.0
              , selectedDateTime: litDay.now
              , daysHaveCircularBorder: false
          )
          , SectionTitle(text: 'Readings For ')
          , SizedBox(height: 12.0)
          , PageHeader(litDay: litDay)
          , Text('Morning Prayer')
          , Text('Evening Prayer')
          , Text('Eucharist')
        ],
      )
    );

  }
}

class IphodDay extends StatelessWidget {
  IphodDay(
    this.liturgicalColor
  , this.isSelectable
  , this.index
  , this.isSelectedDay
  , this.isToday
  , this.isPrevMonthDay
  , this.textStyle
  , this.isNextMonthDay
  , this.isThisMonthDay
  , this.now
  );
  final Color liturgicalColor;
  final bool isSelectable;
  final int index;
  final bool isSelectedDay;
  final bool isToday;
  final bool isPrevMonthDay;
  final TextStyle textStyle;
  final bool isNextMonthDay;
  final bool isThisMonthDay;
  final DateTime now;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: liturgicalColor,
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CalendarCarousel().dayCrossAxisAlignment,
        mainAxisAlignment: CalendarCarousel().dayMainAxisAlignment,
        children: <Widget>[
          DefaultTextStyle(
            style: textStyle,
            child: Text(
              '${now.day}',
              semanticsLabel: now.day.toString(),
              // style: getDayStyle(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay,
              //    textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
