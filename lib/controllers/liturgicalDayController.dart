import 'package:get/get.dart';
import 'package:legereme/models/liturgical_day.dart';

class LiturgicalDayController extends GetxController {
  Rx<LiturgicalDay> _day = Rx<LiturgicalDay>();

  LiturgicalDay get day => _day.value;

  LiturgicalDay init({String thisService, DateTime now}) {
    _day.value = LiturgicalDay().init(service: thisService, now: now);
    return _day.value;
  }

}