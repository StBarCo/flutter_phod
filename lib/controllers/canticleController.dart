import 'package:get/get.dart';
import 'package:flutter_phod/models/canticle.dart';
import 'package:flutter_phod/services/canticles_db.dart';
import 'package:meta/meta.dart';

class CanticleController extends GetxController {
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
}
