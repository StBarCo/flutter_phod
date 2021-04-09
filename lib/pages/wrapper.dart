import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:legereme/controllers/authController.dart';
import 'package:legereme/controllers/userController.dart';
import 'package:legereme/pages/authenticate.dart';
import 'package:legereme/pages/compline.dart';
import 'package:legereme/pages/evening_prayer.dart';
import 'package:legereme/pages/midday.dart';
import 'package:legereme/pages/morning_prayer.dart';


class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    // return either correct office or authenticate

    Widget thisOffice;
    // final user = Provider.of<User>(context);
    final now = DateTime.now();
    final midday = DateTime(now.year, now.month, now.day, 11, 30);
    final evening = DateTime(now.year, now.month, now.day, 15); // 3PM
    final compline = DateTime(now.year, now.month, now.day, 20); // 8PM
    // if ( user == null ) {
    //  return Authenticate();
    // }
    if (now.isBefore(midday)) {
      thisOffice = MorningPrayer();
    }
    else if (now.isBefore(evening)) {
      thisOffice = Midday();
    }
    else if (now.isBefore(compline)) {
      thisOffice = EveningPrayer();
    }
    else {
      thisOffice = Compline();
    }

    return GetX(
      initState: (_) async {
        Firebase.initializeApp();
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get
            .find<AuthController>()
            .user
            ?.uid != null) {
          return thisOffice;
        } else {
          return Authenticate();
        }
      },
    );
  }
}
