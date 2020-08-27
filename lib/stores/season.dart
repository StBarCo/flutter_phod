import 'package:date_util/date_util.dart';
import 'package:flutter_phod/stores/helpers.dart';

class Season {
  String id = '';
  String title = '';
  int week = 0;
  List<String> colors = [];
  String lityear = '';

  Season({this.id, this.title, this.week, this.colors, this.lityear});
}

Season findRLD(String season, DateTime now) {
  int doy = dateToDOY(now);
  int dayOfWeek = now.weekday;
  bool leapYear = DateUtil().leapYear(now.year);
  int sunday = thisSunday(doy, dayOfWeek, leapYear);
  bool tranlateRLD = !(season == 'epiphany' || season == 'proper');
  bool isSunday = isItSunday(now);
  if (isSunday && tranlateRLD) return notRLD;
  // so far it's OK to RLD even if Sunday
  if (redLetterDays[doy]) return redLetterDays[doy];
  // so far: today isn' an RLD
  // if it's Sunday, we're done
  if (isSunday) return notRLD;
  // so far: it's not Sunday and not RLD
  // if last Sunday wasn't an RLD, we're done
  Season rld = redLetterDays[thisSunday(doy, now.weekday, DateUtil().leapYear(now.year))];
  if (rld == null) return notRLD;
  // so far, today is not Sunday and not an RLD
  // and last Sunday was an RLD that needs to be translated
  // NOW for the special case where last Sunday's RLD needs to be translated
  int i = sunday + 1;
  // find the first none RLD after Sunday
  // usually Monday, but there are instances...
  while (redLetterDays[i]) {
    i += 1;
  }
  // i is now the first none RLD after Sunday, use it for translating
  // if i is today, today is the first available day to transfer; return the RLD
  if (i == doy) return rld;
  // if i isn't today, we've already displayed the RLD
  return notRLD;
}

Season findTheSeason(int doy, int easterDOY, DateTime now) {
  // Season rld = this.findRLD(season, now);
  // if (rld.id.isNotEmpty) return rld;
  bool leapYear = DateUtil().leapYear(now.year);
  int d;
  if (inRange(doy, d = advent1DOY(now.year), dayBefore(christmasDOY))) {
      return createSeason('advent', 'Advent', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = christmasDOY, dayBefore(epiphanyDOY))) {
      return createSeason('christmas', 'Christmas', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = epiphanyDOY, dayBefore(ashWednesdayDOY(easterDOY, leapYear)))) {
      return createSeason('epiphany', 'Epiphany', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = ashWednesdayDOY(easterDOY, leapYear), dayBefore(palmSundayDOY(easterDOY)))) {
      return createSeason('lent', 'Lent', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = palmSundayDOY(easterDOY), dayBefore(easterDOY))) {
      return createSeason('holyWeek', 'Holy Week', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = ascensionDOY(easterDOY), d + 2)) {
      return createSeason('ascension', 'Ascension', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = easterDOY, dayBefore(pentecostDOY(easterDOY)))) {
      return createSeason('easter', 'Easter', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = pentecostDOY(easterDOY), d + 6)) {
      return createSeason('pentecost', 'Pentecost', daysToWeeks(doy -d), now);
  } else if (inRange(doy, d = trinityDOY(easterDOY), d + 6)) {
      return createSeason('trinity', 'Trinity Sunday', daysToWeeks(doy -d), now);
  } else { // season following Pentecost
      return createSeason('proper', 'Season following Pentecost', daysToWeeks(doy -d), now);
  }
}

Season notRLD = Season(id: "", title: "", week: 0, colors: []);
Map redLetterDays = {
  324: Season(id: 'confessionOfStPeter',
      title: 'Confession Of St Peter',
      colors: white),
  331: Season(id: 'conversionOfStPaul',
      title: 'Conversion of St Paul',
      colors: white),
  339: Season(id: 'presentation', title: 'The Presentation', colors: white),
  361: Season(id: 'stMatthias', title: 'St Matthias', colors: red),
  19: Season(id: 'stJoseph', title: 'St Joseph', colors: white),
  25: Season(id: 'annunciation', title: 'The Annuciation', colors: white),
  56: Season(id: 'stMark', title: 'St. Mark', colors: red),
  62: Season(
      id: 'stsPhilipAndJames', title: 'Saints Philip and James', colors: red),
  92: Season(id: 'visitation', title: 'Visitation', colors: blue),
  103: Season(id: 'stBarnabas', title: 'St. Barnabus', colors: red),
  116: Season(id: 'nativityOfJohnTheBaptist',
      title: 'Nativity of John the Baptist',
      colors: white),
  121: Season(
      id: 'stPeterAndPaul', title: 'Saints Peter and Paul', colors: red),
  123: Season(id: 'dominion', title: 'Dominion Day', colors: white),
  125: Season(id: 'independence', title: 'Independence Day', colors: white),
  143: Season(
      id: 'stMaryMagdalene', title: 'St. Mary Magdalene', colors: white),
  147: Season(id: 'stJames', title: 'St James', colors: red),
  159: Season(id: 'transfiguration',
      title: 'Feast of the Transfiguration',
      colors: white),
  168: Season(id: 'bvm', title: 'Blessed Virgin Mary', colors: white),
  177: Season(id: 'stBartholomew', title: 'St. Bartholomew', colors: red),
  198: Season(id: 'holyCross', title: 'Holy Cross', colors: red),
  205: Season(id: 'stMatthew', title: 'St. Matthew', colors: red),
  213: Season(
      id: 'michaelAllAngels', title: 'Michael and All Angels', colors: white),
  232: Season(id: 'stLuke', title: 'St. Luke', colors: red),
  237: Season(
      id: 'stJamesOfJerusalme', title: 'St. James of Jerusalem', colors: red),
  242: Season(
      id: 'stsSimonAndJude', title: 'Saints Simon and Jude', colors: red),
  256: Season(id: 'remembrance', title: 'Remembrance Day', colors: white),
  275: Season(id: 'stAndrew', title: 'St. Andrew', colors: red),
  296: Season(id: 'stThomas', title: 'St. Thomas', colors: red),
  301: Season(id: 'stStephen', title: 'St. Stephen', colors: red),
  302: Season(id: 'stJohn', title: 'St. John', colors: white),
  303: Season(id: 'holyInnocents', title: 'Holy Innocents', colors: red),
};

List<String> getColors(String season, int week, DateTime now) {
  bool isSunday = isItSunday(now.weekday);
  Map basicColors = {
    'advent': ["purple"],
    'christmas': ["white", "gold"],
    'epiphany': ['green'],
    'lent': ['purple'],
    'holyWeek': ['purple'],
    'easter': ['white'],
    'ascension': ['white'],
    'pentecost': ['red'],
    'trinity': ['white'],
    'proper': ['green'],
  };
  // handle the exceptions
  switch (season) {
    case 'advent':
      {
        if (isSunday && week == 3) return ['rose', 'purple'];
        return basicColors[season];
      }
      break;
    case 'epiphany':
      {
        if (week <= 2) return ['white', 'gold'];
        return basicColors[season];
      }
      break;
    case 'lent':
      {
        if (isSunday && week == 4) return ['rose', 'purple'];
        return basicColors[season];
      }
      break;
    case 'holyWeek':
      {
        switch (now.weekday) {
          case 7:
            {
              return ['red', 'purple'];
            }
            break; // Palm Sunday
          case 4:
            {
              return ['white'];
            }
            break; // Maunday Thursday
          case 5:
            {
              return ['black', 'purple'];
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

Season createSeason(String id, String title, int week, DateTime now) {
  return Season(id: id, title: title, week: week, colors: getColors(id, week, now)
  );

}
