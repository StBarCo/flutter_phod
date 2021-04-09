import 'package:get/get.dart';
import 'package:legereme/models/occasional_prayer.dart';
import 'package:legereme/services/occasional_prayers_db.dart';

class OccasionalPrayerController extends GetxController {
  Rx<List<OccasionalPrayerModel>> opList = Rx<List<OccasionalPrayerModel>>();
  Rx<List<String>> opCats = Rx<List<String>>();
  Rx<String> _selectedOP = Rx<String>();
  Rx<String> _selectedCategory = Rx<String>();

  List<OccasionalPrayerModel> get all => opList.value;

  List<String> get categories {
    List<String> catz = opList.value.map((el) => el.category).toSet().toList();
    return catz;
  }

  String get currentCategory => _selectedCategory.value;
  void selectCategory(cat) => _selectedCategory.value = cat;
  Rx<String> get clearCategory => _selectedCategory = Rx<String>("");

  String get selected => _selectedOP.value;
  OccasionalPrayerModel byId(id) => opList.value.firstWhere( (el) => el.id == id);
  OccasionalPrayerModel get current => byId( _selectedOP.value );
  void select(id) => _selectedOP.value = id;
  Rx<String> get clearSelected => _selectedOP = Rx<String>("");

  List<OccasionalPrayerModel> ofCategory(category) {
    List<OccasionalPrayerModel> ops = opList.value.where( (el) => el.category == category).toList();
    return ops;
  }

   @override
  void onInit() {
    opList.bindStream( OccasionalPrayerDB().opStream);
  }
}
