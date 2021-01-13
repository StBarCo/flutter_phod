import 'package:get/get.dart';

class ConfigModel {
  String psalmCycle = '30DayCycle';

  ConfigModel ({this.psalmCycle});
}

class ConfigController extends GetxController {
  final _psalmCycle = '30DayCycle'.obs;

  String get psalmCycle => _psalmCycle.value;

  void setPsalmCycle(String cycle) {
    switch( cycle ) {
      case '30DayCycle':
      case '60DayCycle': _psalmCycle.value = cycle; break;
      default: _psalmCycle.value = '30DayCycle';
    }
  }

  @override
  void init() {
    _psalmCycle.value = '30DayCycle';
  }

}