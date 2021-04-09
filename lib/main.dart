import 'package:get/get.dart';
import 'package:legereme/controllers/bindings/authBinding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:legereme/pages/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Iphod());
}

class Iphod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Wrapper(),
      initialBinding: AuthBinding(),
      initialRoute: "/",
    );
  }

}