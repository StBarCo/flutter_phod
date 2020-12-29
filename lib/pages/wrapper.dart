import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phod/controllers/authController.dart';
import 'package:flutter_phod/controllers/userController.dart';
import 'package:flutter_phod/pages/authenticate.dart';
import 'package:flutter_phod/pages/compline.dart';
import 'package:flutter_phod/pages/evening_prayer.dart';
import 'package:flutter_phod/pages/midday.dart';
import 'package:flutter_phod/pages/morning_prayer.dart';


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
        print("CURRENT USER ${Get
            .find<AuthController>()
            .user
            ?.uid}");
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
