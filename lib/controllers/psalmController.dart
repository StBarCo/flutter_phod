import 'package:get/get.dart';
import 'package:flutter_phod/models/psalm_model.dart';

class PsalmController extends GetxController {
  final Rx<List<PsalmModel>> _psalms = Rx<List<PsalmModel>>();
  final _selected = PsalmModel().obs;

  List<PsalmModel> get psalms => _psalms.value;

  void get clearPsalms => _psalms.value = [];
  void appendPsalm(PsalmModel ps) {
    _psalms.value.add(ps);
  }

  PsalmModel get selected => _selected.value;
  bool get selectedAvailable => _selected.value != PsalmModel();
  List<String> get psalmsAvailable => _psalms.value.map<String>( (p) => p.name).toList();

  void select( String title) {
    _psalms.value.forEach((ps) {
      if( ps.title == title) _selected.value = ps;
    });
  }

  @override
  void onInit() async {
    _psalms.value = [];
  }
}