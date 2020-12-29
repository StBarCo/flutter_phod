import 'package:get/get.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_phod/models/calendar_day.dart';

class LiturgicalCalendar {
  List<CalendarDayModel> days = [];
  String monthName = "";

  LiturgicalCalendar({this.days, this.monthName});
}

class LiturgicalCalendarController extends GetxController {
  Rx<LiturgicalCalendar> _cal = Rx<LiturgicalCalendar>();
  Rx<CalendarDayModel> _today = Rx<CalendarDayModel>();
  Rx<CalendarDayModel> _selectedDay = Rx<CalendarDayModel>();
  Rx<String> _readingsFor = Rx<String>();

  List<String> dayNames = ["Sun", "Mon", "Tues", "Wed", "Thr", "Fri", "Sat"];

  LiturgicalCalendar get calendar => _cal.value;
  List<CalendarDayModel> week(int n) {
    if (n*7+7 > _cal.value.days.length) return List<CalendarDayModel>();
    return _cal.value.days.getRange(n * 7, n * 7 + 7).toList();
  }

    void nextMonth() => init(  _selectedDay.value.day.now.addMonths(1) ); // init(_today.value.day.now.addMonths(1));
    void lastMonth() => init( _selectedDay.value.day.now.addMonths(-1) ) ; // init(_today.value.day.now.addMonths(-1));
    void backToToday() {
      init( DateTime.now() );
    }
      void nextAshWednesday() => _selectedDay.value = _selectedDay.value;
      void nextEaster() => _selectedDay.value = _selectedDay.value;
      String get month => _cal.value.monthName;

      CalendarDayModel get today => _today.value;
      CalendarDayModel get selected => _selectedDay.value;

      String get readingsFor => _readingsFor.value;

      CalendarDayModel select(thisDay) {
        return _selectedDay.value = thisDay;
      }

      CalendarDayModel selectService( String service) {
        CalendarDayModel day = _today.value;
        day.day.service = service;
        return day;
      }

      String selectReadingFor(s) => _readingsFor.value = s;

      // changing the month will require an init function
      void init(DateTime now) {
        _cal.value = LiturgicalCalendar();
        // DateTime now = DateTime.now();
        DateTime thisDay = startOfMonth(now);
        DateTime last = lastOfMonth(now);
        List<CalendarDayModel> theseCalendarDays  = [];
        _cal.value.monthName = now.format("MMMM");
        int index = 0;
        // _today.value = (now.isToday) ? now : _today.value;
        while (thisDay <= last) {
          theseCalendarDays.add( CalendarDayModel().init(now, thisDay, index) );
          if (isSameDay(thisDay, now)) {
            print(">>>>> THISDAY & NOW: $thisDay, $now, ${now.isToday}");
            _today.value = (now.isToday) ? theseCalendarDays[index] : _today.value;
            _selectedDay.value = theseCalendarDays[index];
          }
          index += 1;
          thisDay = nextDay(thisDay);
        }
        _cal.value.days = theseCalendarDays;
        index = 0; // we'll just reuse it
      }

      @override
      void onInit() {
        init(DateTime.now() );
        super.onInit();
      }
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
    return 0; // shouldn't ever get here
  }
