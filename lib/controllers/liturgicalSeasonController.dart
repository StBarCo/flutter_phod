import 'package:get/get.dart';
import 'package:legereme/models/liturgical_season.dart';

class LiturgicalSeasonController extends GetxController {
  Rx<LiturgicalSeason> _season = Rx<LiturgicalSeason>();

  LiturgicalSeason get season => _season.value;
  LiturgicalSeason createSeason(String id, String title, int week, DateTime now) {
    _season.value = LiturgicalSeason(id: id, title: title, week: week);
    return _season.value;
  }

}
