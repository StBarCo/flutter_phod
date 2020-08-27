import 'package:date_util/date_util.dart';
import 'package:flutter_phod/stores/helpers.dart';
import 'package:flutter_phod/stores/season.dart';

class LitDay {
  DateTime now = DateTime.now();
  int doy; // day of liturgical year, mar 1st = 1
  // int dow = now.weekday; // day of week, monday is 1, sunday = 7
  // int dom; // day of month [1 - 31]
  // int mon; // january is 1
  String mpep; // 'mpep' + MMdd
  // int year;
  int easter; // day of year from Mar 1
  int advent1; // day of year from Mar 1
  bool leap; // is leap year?
  int sunday; // litDOY of last sunday
  bool isSunday; // is today sunday?
  int nextSunday; // LitDOY of next Sunday
  Season season; // Lit season
  String litYear; // a, b, or c
  String service = ''; // current service

  LitDay init({String service, DateTime now}) {
    // I want to init with or without now set
    now = (now != null) ? now : this.now;
    bool leapYear = DateUtil().leapYear(now.year);
    int easter = easterDOY(now.year);

    this.service = service;
    this.now = now;
    this.doy = dateToDOY(now);
    this.easter = easterDOY(now.year);
    this.advent1 = advent1DOY(now.year);
    this.leap = leapYear;
    this.nextSunday = thisNextSunday(this.doy, now.weekday, leapYear);
    this.sunday = thisSunday(this.doy, now.weekday, leapYear); // Sunday of current week; aka last sunday
    this.isSunday = now.weekday == DateTime.sunday;
    this.season = findTheSeason(this.doy, easter, now);
    this.litYear = litYearName(this.doy, now.year);
    return this;
  }

}
