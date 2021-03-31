import 'package:flutter_phod/controllers/canticleController.dart';
import 'package:flutter_phod/services/psalms_db.dart';
import 'package:flutter_phod/services/scripture_db.dart';
import 'package:flutter_phod/stores/helpers.dart';
import 'package:get/get.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_phod/models/calendar_day.dart';

CanticleController cc = Get.put( CanticleController() );

class LiturgicalCalendar {
  List<CalendarDayModel> days = [];
  String monthName = "";

  LiturgicalCalendar({this.days, this.monthName});
}

class LiturgicalCalendarController extends GetxController {
  final _cal = LiturgicalCalendar().obs;
  final _today = CalendarDayModel().obs;
  final _selectedDay = CalendarDayModel().obs;
  final _currentService = "".obs;

  List<String> dayNames = ["Sun", "Mon", "Tues", "Wed", "Thr", "Fri", "Sat"];

  LiturgicalCalendar get calendar => _cal.value;
  List<CalendarDayModel> week(int n) {
    if (n*7+7 > _cal.value.days.length) return List<CalendarDayModel>();
    return _cal.value.days.getRange(n * 7, n * 7 + 7).toList();
  }

  void nextMonth() => init(  _selectedDay.value.litDay.now.addMonths(1) ); // init(_today.value.day.now.addMonths(1));
  void lastMonth() => init( _selectedDay.value.litDay.now.addMonths(-1) ) ; // init(_today.value.day.now.addMonths(-1));
  void backToToday() {
      init( DateTime.now() );
  }
  void nextAshWednesday() {
    this.init( getNextAshWednesday(_selectedDay.value.litDay.now) ); // sets _selectedDay.value;
  }

  void nextEaster() {
    this.init( getNextEaster(_selectedDay.value.litDay.now) ); // sets _selectedDay.value;
}


  String get month => _cal.value.monthName;

  CalendarDayModel get today => _today.value;
  CalendarDayModel get selectedDay => _selectedDay.value;

  String get readingsFor => _selectedDay.value.litDay.service;
  String get selectedService => _currentService.value;

  CalendarDayModel select(CalendarDayModel thisDay) {
        String season = thisDay.litDay.season.id + thisDay.litDay.season.week.toString();
        thisDay.litDay.service = _selectedDay.value.litDay.service;
        _selectedDay.value = thisDay;
        _currentService.value = thisDay.litDay.service;
        if (thisDay.litDay.service == "eu") {
          switch (season) {
            case "holyWeek0":
              return _selectedDay.value; // Palm Sunday
            case "holyWeek6":
              return _selectedDay.value; // HolySaturday
            case "easter1":
              return _selectedDay.value; // Easter Day
          }
        }
        initLessons(_selectedDay.value.litDay.service);
        return _selectedDay.value;
  }

  CalendarDayModel selectService( String service) {
        // if service changes, we'll have to update the lessons
        _selectedDay.value.litDay.service = service; // set the litDay service value
        _currentService.value = service;
        initLessons(service);
        return _selectedDay.value;
  }

      // if service has a value - update the lessons
  void initLessons(String service) {
        if (service == null || service.isBlank) return;
        _selectedDay.value.litDay.service = service;
        _currentService.value = service;
        if (service == 'mp' || service == 'ep') {
          PsalmsDB().getDailyPsalms(_selectedDay.value, service);
          cc.setDefaultInvitatory(_selectedDay.value.litDay);
        }
        ScriptureDB().getLessons();
  }

      // changing the month will require an init function
  void init(DateTime now) {
        _cal.value = LiturgicalCalendar();
        DateTime thisDay = startOfMonth(now);
        DateTime last = lastOfMonth(now);
        List<CalendarDayModel> theseCalendarDays  = [];
        _cal.value.monthName = now.format("MMMM");
        int index = 0;
        // _today.value = (now.isToday) ? now : _today.value;
        while (thisDay <= last) {
          theseCalendarDays.add(CalendarDayModel().init(now, thisDay, index));
          if (isSameDay(thisDay, now)) {
            _today.value =
            (now.isToday) ? theseCalendarDays[index] : _today.value;
            _selectedDay.value = theseCalendarDays[index];
          }
          index += 1;
          thisDay = nextDay(thisDay);
        }
        initLessons( _selectedDay.value.litDay.service);
        _cal.value.days = theseCalendarDays;
  }

  @override
  void onInit() {
    _cal.value = LiturgicalCalendar();
    DateTime now = DateTime.now();
    DateTime thisDay = startOfMonth(now);
    DateTime last = lastOfMonth(now);
    List<CalendarDayModel> theseCalendarDays  = [];
    _cal.value.monthName = now.format("MMMM");
    int index = 0;
    // _today.value = (now.isToday) ? now : _today.value;
    while (thisDay <= last) {
      theseCalendarDays.add(CalendarDayModel().init(now, thisDay, index));
      if (isSameDay(thisDay, now)) {
        _today.value =
        (now.isToday) ? theseCalendarDays[index] : _today.value;
        _selectedDay.value = theseCalendarDays[index];
      }
      index += 1;
      thisDay = nextDay(thisDay);
    }
    _cal.value.days = theseCalendarDays;
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
