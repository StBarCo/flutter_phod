import 'package:date_util/date_util.dart';
import 'package:flutter_phod/stores/litday.dart';

const List<String> white = ['white'];
const List<String> red = ['red'];
const List<String> blue = ['blue'];

const int sunday = 7;
const int christmasDOY = 300;
const int newyearsDOY = 307;
const int dec31DOY = 306;
const int epiphanyDOY = 312;
const int proper1DOY = 68; // may 8
// easter offsets
const int ashWednesdayOffset = -46;
const int palmSundayOffset = -7;
const int ascensionOffset = 39;
const int pentecostOffset = 49;
const int trinityOffset = 56;

bool isItSunday(dow) => dow == sunday;

int dateToDOY( DateTime now) {
  List<int> dpm = [
    0, // zeroth month place holder - months are 1 - 12 not 0 - 11 (like javascript)
    306, // January 1 - 31
    337, // February 1 - 28/29
    0, // March 1 - 31
    31, // April 1 - 30
    61, // May 1 - 31
    92, // June 1 - 30
    122, // July 1 - 31
    153, // August 1 -31
    184, // September 1 - 30
    214, // October 1 - 31
    245, // November 1 - 30
    275, // December 1 - 31
  ];
  return dpm[now.month] + now.day;
}

// get date of easter for given year
DateTime yearToEaster(int year) {
  int a = year % 19;
  int b = (year / 100 ).floor();
  int c = year % 100;
  int d = (b / 4).floor();
  int e = b % 4;
  int f = ( (b + 8) / 25 ).floor();
  int g = ( (b - f + 1 ) / 3 ).floor();
  int h = (19 * a + b -d -g + 15) % 30;
  int i = (c / 4).floor();
  int k = c % 4;
  int l = (32 + 2 * e + 2 * i - h - k) % 7;
  int m = ( (a + 11 * h + 22 * l) / 451 ).floor();
  int n0 = (h + l + 7 * m + 114);
  int n = ( n0 / 31).floor() - 1;
  int p = n0 % 31 + 1;
  return DateTime(year, n, p);
}

int easterDOY(int year) => dateToDOY( yearToEaster(year) );
int palmSundayDOY(int easterDOY) => easterDOY + palmSundayOffset;
int ascensionDOY(int easterDOY) => easterDOY + ascensionOffset;
int pentecostDOY(int easterDOY) => easterDOY + pentecostOffset;
int trinityDOY(int easterDOY) => easterDOY + trinityOffset;

int ashWednesdayDOY(int easterDOY, bool leapYear) {
  int doy = easterDOY + ashWednesdayOffset;
  if (doy < 1) {
    doy += leapYear ? 366 : 365;
  }
  return doy;
}

int advent1DOY(int year) {
  int christmasDOY = 300;
  DateTime xday = new DateTime(year, 12, 25);
  int dow = xday.weekday;
  return christmasDOY - (21 + dow);
}

int lastSundayDOY(int doy, int weekday, bool leapYear) {
  int d = doy - weekday;
  if (d < 1) { d += leapYear ? 366 : 365; }
  return d;
}



List<int> doyToMonDay(int doy) {
  [
    [1,   31, 3], // mar
    [32,  30, 4], // apr
    [63,  31, 5], // may
    [93,  30, 6], // jun
    [123, 31, 7], // jul
    [154, 31, 8], // aug
    [185, 30, 9], // sep
    [215, 31, 10], // oct
    [246, 30, 11], // nov
    [276, 31, 12], // dec
    [307, 31, 1], // jan
    [338, 29, 2], // feb
  ].forEach((e) {
    int dOfMonth1 = e[0];
    int dInMonth = e[1];
    int monthNumber = e[2];
    if (doy >= dOfMonth1 && doy < (dOfMonth1 + dInMonth)) {
      return [monthNumber, doy - dOfMonth1 + 1];
    }
  });
}


String litYearName(int doy, int yr) {
  int advent1 = advent1DOY(yr);
  return ['c', 'a', 'b'][((doy >= advent1 ) ? yr + 1 : yr) % 3];
}

bool inRange(int target, from, int to) {
  if ( from > to ) return (target >= from || target <= to); // spanning feb/mar
  return (target >= from && target <= to);
}

// dayBefore will break on March 1
// but (wisely) nothing liturgical happens on 2/28 - 3/1
// it's just syntactial candy
int dayBefore(int d) => d -= 1;

int daysToWeeks( int n ) => (n / 7).floor() + 1;

int calculateProper( int doy ) => ((doy - proper1DOY) / 7).floor() + 1;

int thisSunday( int doy, int dayOfWeek, bool leapYear ) {
  int sunDOY = doy - dayOfWeek;
  if ( sunDOY < 1){
    sunDOY += leapYear ? 366 : 365;
  }
  return sunDOY;
}

int thisNextSunday( int doy, int dayOfWeek, bool leapYear) {
  if ( doy == sunday ) { doy += 7; }
  else { doy += (7 - dayOfWeek ); }
  if (leapYear && doy > 366) { doy -= 366; }
  else if ( doy > 365 ) { doy -= 365; }
  return doy;
}
