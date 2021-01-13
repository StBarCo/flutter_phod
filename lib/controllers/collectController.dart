import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/models/collect.dart';
import 'package:flutter_phod/services/collect_db.dart';

import 'liturgicalCalendarController.dart';

class CollectController extends GetxController {
  final _seasonalCollect = CollectModel().obs;
  final _collectOfDay = CollectModel().obs;
  final _collectPeaceMP = CollectModel().obs;
  final _collectPeaceEP = CollectModel().obs;
  final _collectGrace = CollectModel().obs;
  final _collectPeril = CollectModel().obs;


  CollectModel get seasonalCollect => _seasonalCollect.value;
  CollectModel get collectOfTheDay => _collectOfDay.value;
  CollectModel get epCollectForPeace => _collectPeaceEP.value;
  CollectModel get mpCollectForPeace => _collectPeaceMP.value;
  CollectModel get collectForGrace => _collectGrace.value;
  CollectModel get collectForPeril => _collectPeril.value;

  void setCollect( CollectModel collect, String ofType) {
    switch(ofType) {
      case "week":
        _seasonalCollect.value = collect;
        break;
      case "day":
        _collectOfDay.value = collect;
        break;
      case "MPpeace":
        _collectPeaceMP.value = collect;
        break;
      case "EPpeace":
        _collectPeaceEP.value = collect;
        break;
      case "grace":
        _collectGrace.value = collect;
        break;
      case "perils":
        _collectPeril.value = collect;
        break;
    }

  }

  CollectModel collectOfType(String ofType) {
    print(">>>>> GET COLLECT OF TYPE: $ofType");
    switch ( ofType ) {
      case 'week': return _seasonalCollect.value;
      case 'day': return _collectOfDay.value;
      case 'MPpeace': return _collectPeaceMP.value;
      case 'EPpeace': return _collectPeaceEP.value;
      case 'grace': return _collectGrace.value;
      case 'perils': return _collectPeril.value;
      default: return CollectModel();
    }
  }

  @override
  void onInit() async {
    LiturgicalCalendarController c = Get.put( LiturgicalCalendarController() );

    LiturgicalDay litDay = c.today.day;
    CollectDB().getCollect(litDay, "week");
    CollectDB().getCollect(litDay, 'day');
    CollectDB().getCollect(litDay, 'MPPeace');
    CollectDB().getCollect(litDay, 'EPPeace');
    CollectDB().getCollect(litDay, 'grace');
    CollectDB().getCollect(litDay, 'perils');
  }
}
