import 'package:flutter_phod/helpers/collect.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/models/collect.dart';
import 'package:flutter_phod/services/collect_db.dart';
import 'package:meta/meta.dart';

import 'liturgicalCalendarController.dart';

class CollectController extends GetxController {
  Rx<CollectModel> _seasonalCollect = CollectModel().obs;
  Rx<CollectModel> _collectOfDay = CollectModel().obs;
  Rx<CollectModel> _collectPeaceMP = CollectModel().obs;
  Rx<CollectModel> _collectPeaceEP = CollectModel().obs;
  Rx<CollectModel> _collectGrace = CollectModel().obs;
  Rx<CollectModel> _collectPeril = CollectModel().obs;


  CollectModel get seasonalCollect => _seasonalCollect.value;
  CollectModel get collectOfTheDay => _collectOfDay.value;
  CollectModel get epCollectForPeace => _collectPeaceEP.value;
  CollectModel get mpCollectForPeace => _collectPeaceMP.value;
  CollectModel get collectForGrace => _collectGrace.value;
  CollectModel get collectForPeril => _collectPeril.value;

  CollectModel collectOfType(String ofType) {
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
    _seasonalCollect.value = await CollectDB().getCollect(litDay, "week");
    _collectOfDay.value = await CollectDB().getCollect(litDay, 'day');
    _collectPeaceMP.value = await CollectDB().getCollect(litDay, 'MPPeace');
    _collectPeaceEP.value = await CollectDB().getCollect(litDay, 'EPPeace');
    _collectGrace.value = await CollectDB().getCollect(litDay, 'grace');
    _collectPeril.value = await CollectDB().getCollect(litDay, 'perils');
  }

/*
  Rx<List<CanticleModel>> canticleList = Rx<List<CanticleModel>>();
  Rx<CanticleModel> _selected = Rx<CanticleModel>();

  List<CanticleModel> get canticles => canticleList.value;
  Rx<CanticleModel> get unselect => _selected = Rx<CanticleModel>();
  CanticleModel showThis(value) => _selected.value = value;

  CanticleModel get selected => _selected?.value;
  CanticleModel getByName(id) {
    for (var c in canticleList.value) {
      if ( c.id == id ) return c;
    }
    return CanticleModel(id: id, name: id, notes: "This canticle is missing");
  }

  @override
  void onInit() {
    canticleList.bindStream( CanticleDB().canticleStream);
  }
*/
}
