import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_phod/stores/helpers.dart';

Color
_white = Colors.yellowAccent[100],
    _gold = Colors.yellowAccent,
    _purple = Colors.deepPurpleAccent,
    _green = Colors.green,
    _red = Colors.red,
    _blue = Colors.lightBlue,
    _rose = Colors.pinkAccent,
    _black = Colors.black26
;


class LiturgicalSeason {
  String id = '';
  String antiphon = '';
  String title = '';
  int week = 0;
  List<Color> colors = [];

  LiturgicalSeason({this.id, this.antiphon, this.title, this.week, this.colors});

  // Sunday on May 8 - May 14 is proper 1
  LiturgicalSeason findTheSeason(int doy, int easterDOY, DateTime now) {
    bool leapYear = now.isLeapYear;
    int d;
    LiturgicalSeason seasonSoFar = LiturgicalSeason();
    if (inRange(
        doy, d = christTheKingDOY(now.year), dayBefore(advent1DOY(now.year)))) {
      seasonSoFar = createSeason(
          'christTheKing', 'proper', 'Christ the King', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d = advent1DOY(now.year), dayBefore(christmasDOY))) {
      seasonSoFar = createSeason('advent', 'advent', 'Advent', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d = christmasDOY, dayBefore(epiphanyDOY))) {
      seasonSoFar =
          createSeason('christmas', 'christmas', 'Christmas', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(
        doy, d = epiphanyDOY, dayBefore(ashWednesdayDOY(easterDOY, leapYear)))) {
      seasonSoFar =
          createSeason('epiphany', 'epiphany', 'Epiphany', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d = ashWednesdayDOY(easterDOY, leapYear),
        dayBefore(palmSundayDOY(easterDOY)))) {
      seasonSoFar = createSeason('lent', 'lent', 'Lent', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d = palmSundayDOY(easterDOY), dayBefore(easterDOY))) {
      seasonSoFar =
          createSeason('holyWeek', 'lent', 'Holy Week', doy - d, now);
    } else if (inRange(doy, d = ascensionDOY(easterDOY), d + 2)) {
      seasonSoFar =
          createSeason('ascension', 'ascension', 'Ascension',
              daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d=easterDOY + 1, easterDOY + 6)) { // easter week
      seasonSoFar =
          createSeason('easterWeek', 'easterWeek', 'Easter Week', doy - easterDOY, now);
    }
    else if (inRange(doy, d = easterDOY, dayBefore(pentecostDOY(easterDOY)))) {
      seasonSoFar = createSeason('easter', 'easter', 'Easter', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d = pentecostDOY(easterDOY), d + 6)) {
      seasonSoFar =
          createSeason('pentecost', 'pentecost', 'Pentecost', daysToWeeks(doy - d, leapYear), now);
    } else if (inRange(doy, d = trinityDOY(easterDOY), d + 6)) {
      seasonSoFar =
          createSeason('trinity', 'trinity', 'Trinity Sunday', daysToWeeks(doy - d, leapYear), now);
    } else { // LiturgicalSeason following Pentecost
      seasonSoFar = createSeason('proper', 'proper', 'Season following Pentecost',
          daysToWeeks(doy - proper1Sunday(now), leapYear), now);
    }

    return findRLD(seasonSoFar, now);
  }

}

LiturgicalSeason createSeason(String id, String antiphon, String title, int week,
    DateTime now) {
  return LiturgicalSeason(
      id: id, antiphon: antiphon, title: title, week: week, colors: getColors(id, week, now)
  );
}

LiturgicalSeason findRLD(LiturgicalSeason season, DateTime now) {
  int doy = dateToDOY(now);
  int dayOfWeek = now.weekday;
  bool leapYear = now.isLeapYear;
  int lastSunday = thisSunday(doy, dayOfWeek, leapYear);
  // don't translate RLDs in epiphany and season following pentecost (aka proper)
  bool translateRLD = !(season.id == 'epiphany' || season.id == 'proper');
  bool isSunday = dayOfWeek == sunday;
  if (isSunday && translateRLD) return season;
  // so far it's OK to RLD even if Sunday
  if (redLetterDays[doy] != null) return redLetterDays[doy];
  // so far: today isn't an RLD
  // if it's Sunday, we're done
  if (isSunday) return season;
  // so far: it's not Sunday and not RLD
  // if last Sunday wasn't an RLD, we're done
  LiturgicalSeason rld = redLetterDays[lastSunday];
  if (rld == null) return season;
  // so far, today is not Sunday and not an RLD
  // and last Sunday was an RLD that needs to be translated
  // NOW for the special case where last Sunday's RLD needs to be translated
  int i = lastSunday + 1;
  // find the first none RLD after Sunday
  // usually Monday, but there are instances...
  while (redLetterDays[i] != null) {
    i += 1;
  }
  // i is now the first none RLD after Sunday, use it for translating
  // if i is today, today is the first available day to transfer; return the RLD
  if (i == doy) return rld;
  // if i isn't today, we've already displayed the RLD
  return season;
}


// LiturgicalSeason notRLD = LiturgicalSeason(id: "", title: "", week: 0, colors: []);
Map redLetterDays = {
  324: LiturgicalSeason(id: 'confessionOfStPeter',
      title: 'Confession Of St Peter',
      colors: [_white]),
  331: LiturgicalSeason(id: 'conversionOfStPaul',
      title: 'Conversion of St Paul',
      colors: [_white]),
  339: LiturgicalSeason(
      id: 'presentation', antiphon: 'presentation', title: 'The Presentation', colors: [_white]),
  361: LiturgicalSeason(id: 'stMatthias', title: 'St Matthias', colors: [_red]),
  19: LiturgicalSeason(id: 'stJoseph', title: 'St Joseph', colors: [_white]),
  25: LiturgicalSeason(
      id: 'annunciation', antiphon: 'annunciation', title: 'The Annuciation', colors: [_white]),
  56: LiturgicalSeason(id: 'stMark', title: 'St. Mark', colors: [_red]),
  62: LiturgicalSeason(
      id: 'stsPhilipAndJames',
      title: 'Saints Philip and James',
      colors: [_red]),
  92: LiturgicalSeason(id: 'visitation', title: 'Visitation', colors: [_blue]),
  103: LiturgicalSeason(
      id: 'stBarnabas', title: 'St. Barnabus', colors: [_red]),
  116: LiturgicalSeason(id: 'nativityOfJohnTheBaptist',
      title: 'Nativity of John the Baptist',
      colors: [_white]),
  121: LiturgicalSeason(
      id: 'stPeterAndPaul', title: 'Saints Peter and Paul', colors: [_red]),
  123: LiturgicalSeason(
      id: 'dominion', title: 'Dominion Day', colors: [_white]),
  125: LiturgicalSeason(
      id: 'independence', title: 'Independence Day', colors: [_white]),
  143: LiturgicalSeason(
      id: 'stMaryMagdalene', title: 'St. Mary Magdalene', colors: [_white]),
  147: LiturgicalSeason(id: 'stJames', title: 'St James', colors: [_red]),
  159: LiturgicalSeason(id: 'transfiguration',
      title: 'Feast of the Transfiguration',
      colors: [_white]),
  168: LiturgicalSeason(
      id: 'bvm', title: 'Blessed Virgin Mary', colors: [_white]),
  177: LiturgicalSeason(
      id: 'stBartholomew', title: 'St. Bartholomew', colors: [_red]),
  198: LiturgicalSeason(id: 'holyCross', title: 'Holy Cross', colors: [_red]),
  205: LiturgicalSeason(id: 'stMatthew', title: 'St. Matthew', colors: [_red]),
  213: LiturgicalSeason(
      id: 'michaelAllAngels',
      title: 'Michael and All Angels',
      colors: [_white]),
  232: LiturgicalSeason(id: 'stLuke', title: 'St. Luke', colors: [_red]),
  237: LiturgicalSeason(
      id: 'stJamesOfJerusalme',
      title: 'St. James of Jerusalem',
      colors: [_red]),
  242: LiturgicalSeason(
      id: 'stsSimonAndJude', title: 'Saints Simon and Jude', colors: [_red]),
  246: LiturgicalSeason(
      id: 'all_saints', antiphon: 'all_saints', title: "All Saints", colors: [_white]),
  256: LiturgicalSeason(
      id: 'remembrance', title: 'Remembrance Day', colors: [_white]),
  268: LiturgicalSeason(
      id: 'christ_the_king', title: 'Christ The King', colors: [_white]),
  275: LiturgicalSeason(id: 'stAndrew', title: 'St. Andrew', colors: [_red]),
  296: LiturgicalSeason(id: 'stThomas', title: 'St. Thomas', colors: [_red]),
  301: LiturgicalSeason(id: 'stStephen', title: 'St. Stephen', colors: [_red]),
  302: LiturgicalSeason(id: 'stJohn', title: 'St. John', colors: [_white]),
  303: LiturgicalSeason(
      id: 'holyInnocents', title: 'Holy Innocents', colors: [_red]),
};

List<Color> getColors(String season, int week, DateTime now) {
  bool isSunday = now.weekday == sunday;
  Map basicColors = {
    'advent': [_purple],
    'christmas': [_white, _gold],
    'epiphany': [_green],
    'lent': [_purple],
    'holyWeek': [_purple],
    'easterWeek': [_white],
    'easter': [_white],
    'ascension': [_white],
    'pentecost': [_red],
    'trinity': [_white],
    'proper': [_green],
    'christTheKing': [_white]
  };
// handle the exceptions
  switch (season) {
    case 'advent':
      {
        if (isSunday && week == 3) return [_rose, _purple];
        return basicColors[season];
      }
      break;
    case 'epiphany':
      {
        if (week <= 2) return [_white, _gold];
        return basicColors[season];
      }
      break;
    case 'lent':
      {
        if (isSunday && week == 4) return [_rose, _purple];
        return basicColors[season];
      }
      break;
    case 'holyWeek':
      {
        switch (now.weekday) {
          case 7:
            {
              return [_red, _purple];
            }
            break; // Palm Sunday
          case 4:
            {
              return [_white];
            }
            break; // Maunday Thursday
          case 5:
            {
              return [_black, _purple];
            }
            break; // Good Friday
          default:
            {
              return basicColors[season];
            }
            break;
        }
      }
      break;
    default:
      {
        return basicColors[season];
      }
  }
}
