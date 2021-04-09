import 'package:flutter/material.dart';
import 'package:legereme/models/liturgical_day.dart';
import 'package:dart_date/dart_date.dart';

class CalendarDayModel {
  String id = "";
  bool isSelectable = true;
  int index;
  bool isSelectedDay = false;
  bool isToday = false;
  bool isPrevMonthDay = false;
  TextStyle textStyle;
  bool isNextMonthDay = false;
  bool isThisMonthDay = true;
  LiturgicalDay litDay;

  CalendarDayModel(
      { this.id
      , this.isSelectable
      , this.index
      , this.isSelectedDay
      , this.isToday
      , this.isPrevMonthDay
      , this.textStyle
      , this.isNextMonthDay
      , this.isThisMonthDay
      , this.litDay
      }
  );

  CalendarDayModel init( DateTime today, DateTime now, int index ) {
    int thisMonthDiff = diffMonth(today, now);
    this.isSelectable = true;
    this.index = index;
    this.isSelectedDay = false;
    this.isToday = (today == now);
    this.isPrevMonthDay = thisMonthDiff > 0;
    this.isNextMonthDay = thisMonthDiff < 0;
    this.isThisMonthDay = thisMonthDiff == 0;
    this.litDay = LiturgicalDay().init(now: now);
    return this;

  }

  int diffMonth( DateTime today, DateTime now ) {
    int diff = today.getMonth - now.getMonth;
    if (diff == 0) return 0;
    // diff > 0 when now is last month except when today is in December
    if (diff > 0) return (today.getMonth == 12) ? -1 : 1;
    // diff < 0 when now is next month except when today is in January
    if (diff < 0) return (today.getMonth == 1) ? 1 : -1;
  }

}
