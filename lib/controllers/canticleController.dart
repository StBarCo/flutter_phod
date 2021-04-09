import 'package:legereme/models/liturgical_day.dart';
import 'package:get/get.dart';
import 'package:legereme/models/canticle.dart';
import 'package:legereme/services/canticles_db.dart';

class CanticleController extends GetxController {
  final canticleList = <CanticleModel>[].obs;
  final _selected = CanticleModel().obs;
  final _invitatory = CanticleModel().obs;

  CanticleModel get invitatory => _invitatory.value;
  void initInvitatory(invit) => _invitatory.value = invit;
  void setInvitatory(s) => _invitatory.value = getByName(s);
  void setDefaultInvitatory(LiturgicalDay litDay) {
    String invit;

      if (litDay.service == "ep") invit = "phos_hilaron";
    invit = (litDay.doy % 2) == 1 ? "venite" : "jubilate";

      // during Eastertide, Pascha Nostrum only
      if (litDay.season == 'easter') invit = "pascha_nostrum";

      //  on the 19th of the month (paslm 95 day), do not use venite
      if (litDay.now.day == 19) invit = "jubilate";

      //  during Lent, Venite (long version) only
      if (litDay.season == "ashWednesday" || litDay.season == "lent") {
        //  Sundays in lent: jubilate
        litDay.now.weekday == 7
            ? invit = "jubilate"
            : invit = "venite_long";
      }
      CanticleDB().initInvitatory(invit);

    }

  List<CanticleModel> get canticles => canticleList.value;
  void get unselect => _selected.value = CanticleModel();
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
