import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/lit_calendar.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class Calendar extends StatelessWidget {
  CalendarController c = Get.put( CalendarController() );
  @override
  Widget build(BuildContext context) {
    c.setDays( DateTime.now() );
    return IphodScaffold(
        title: 'Calendar',
        body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            children: <Widget>[
              PageHeader(litDay: LitDay().init()),
              RenderLitCalendar( )
            ]
          )
      )
    );
  }
}

/*

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // CalendarController _controller;
  LitDay litDay = LitDay().init();
  String readingsFor;
  @override
//  initState() {
//    super.initState();
//    _controller = CalendarController();
//  }
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Calendar',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        children: <Widget>[
            PageHeader(litDay: LitDay().init())
          , Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(
                color: Colors.pinkAccent,
                width: 2,
              )
              ),
            child: CalendarCarousel(
              weekFormat: false
            // , markedDatesMap: _markedDateMap // List<Events>
            , height: 497.0
            , width: 390.0
            , todayBorderColor: Colors.black12
            , selectedDateTime: litDay.now
            , selectedDayBorderColor: Colors.black12,
                onDayPressed: (date, events) {
                  setState(() {
                    litDay = LitDay().init(now: date);
                    readingsFor = null;
                  });
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
                      case 'black': liturgicalColor = Colors.grey[800]; break;
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
            ),
          )
          , SectionTitle(text: 'Readings For ', center: true, leadingSpace: 0.0)
          // , SizedBox(height: 12.0)
          , PageHeader(litDay: litDay)
          , ButtonBar(
                // mainAxisSize: MainAxisSize.min
               alignment: MainAxisAlignment.center
             , buttonMinWidth: 100.0
             , children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                          setState(() {
                            readingsFor = "mp";
                          });
                        }
                        , child: Text("Morning Prayer")
                    )
                  , RaisedButton(
                      onPressed: () {
                        setState(() {
                          readingsFor = "ep";
                        });
                      }
                      , child: Text("Evening Prayer")
                  )
                  , RaisedButton(
                      onPressed: () {
                        setState(() {
                          readingsFor = "eu";
                        });
                      }
                      , child: Text("Eucharist")
                  )
          ]
          )
          , ReferencesFor(litDay, readingsFor)
        ],
      )
      )
    );
  }
}

class ReferencesFor extends StatefulWidget {
  ReferencesFor(this.litDay, this.service);
  final LitDay litDay;
  final String service;

  @override
  _ReferencesForState createState() => _ReferencesForState();
}

class _ReferencesForState extends State<ReferencesFor> {
  Future futureRefs;

  void  initState() {
    super.initState();
    futureRefs = _getRefs();
  }

  _getRefs() async {
  return await ScriptureDB().getServiceRefs(widget.litDay, widget.service);
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ScriptureDB().getServiceRefs(widget.litDay, widget.service),
        builder: (context, snapshot) {
          switch( snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Service Refs go here");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text("Waiting for Service Refs");
            case ConnectionState.done:
              return ShowRefs(refs: snapshot.data, service: widget.service); // snapshot data
            default:
              return Text('CANTICLE GOES HERE');
          }
        }
    );
  }
}

class ShowRefs extends StatelessWidget {
  final DocumentSnapshot refs;
  final String service;
  ShowRefs({Key key, this.refs, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(service) {
      case "mp":
      case "ep":
        return MPEPRefs(refs, service);
        break;
      case "eu":
        return EURefs(refs);
        break;
      default:
        return Container();
    }
  }
}

class MPEPRefs extends StatelessWidget {
  MPEPRefs(this.doc, this.service);
  final DocumentSnapshot doc;
  final String service;


  Widget build(BuildContext context) {
    List psalms = (service == 'mp') ? doc.get('mpp') : doc.get('epp');
    List firstReading = (service == 'mp') ? doc.get('mp1') : doc.get('ep2');
    List secondReading = (service == 'mp') ? doc.get('mp2') : doc.get('ep2');

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            _PsalmRefs(psalms)
          , _ReadingRefs(firstReading)
          , _ReadingRefs(secondReading)
    ]
    );
  }
}

class EURefs extends StatelessWidget {
  EURefs(this.doc);
  final DocumentSnapshot doc;

  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            _ReadingRefs(doc.get('ot'))
          , _PsalmRefs(doc.get('ps'))
          , _ReadingRefs(doc.get('nt'))
          , _ReadingRefs(doc.get('gs'))
    ]
    );
  }
}

class _ReadingRefs extends StatelessWidget {
  _ReadingRefs(this.refs);
  final List refs;
  Widget build(BuildContext context) {
    print("READING REFS: $refs");
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: refs.map<Widget>( (ref) =>
            Text("${ref['read']} - ${ref['style']}")
        ).toList()
    );
  }
}


class _PsalmRefs extends StatelessWidget {
  _PsalmRefs(this.psalms);
  final List psalms;
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: psalms.map<Widget>((ps) {
          // if eucharistic psalm, ps['ps'] is null
          // and has different format, which really should be fixed
          // setting of psTo is for readability
          String psTo = "${ (ps['to'] == 999) ? 'end' : ps['to']}";
          return (ps['ps'] == null)
            ? Text("${ps['read']} - ${ps['style']}")
            : Text("Psalm ${ps['ps']}: ${ps['from']} - $psTo");
        }).toList()
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
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            color: liturgicalColor,
        ),
      width: 150.0,
      height: 150.0,
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


 */