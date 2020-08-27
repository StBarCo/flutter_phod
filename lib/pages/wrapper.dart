import 'package:flutter/material.dart';
import 'package:flutter_phod/pages/authenticate.dart';
import 'package:flutter_phod/pages/compline.dart';
import 'package:flutter_phod/pages/evening_prayer.dart';
import 'package:flutter_phod/pages/midday.dart';
import 'package:flutter_phod/pages/morning_prayer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either correct office or authenticate
    final user = Provider.of<User>(context);
    final now = DateTime.now();
    final midday = DateTime(now.year, now.month, now.day, 11, 30);
    final evening = DateTime(now.year, now.month, now.day, 15); // 3PM
    final compline = DateTime(now.year, now.month, now.day, 20); // 8PM
    print(user);
    if ( user == null ) {
      return Authenticate();
    }
    else if ( now.isBefore(midday) ) { return MorningPrayer(); }
    else if ( now.isBefore(evening) ) { return Midday(); }
    else if ( now.isBefore(compline) ) { return EveningPrayer(); }
    else { return Compline(); }
  }
}
