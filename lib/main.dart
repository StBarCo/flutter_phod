import 'package:get/get.dart';
import 'package:flutter_phod/controllers/bindings/authBinding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phod/pages/calendar.dart';
import 'package:flutter_phod/pages/morning_prayer.dart';
import 'package:flutter_phod/pages/midday.dart';
import 'package:flutter_phod/pages/evening_prayer.dart';
import 'package:flutter_phod/pages/compline.dart';
import 'package:flutter_phod/pages/family_prayers.dart';
import 'package:flutter_phod/pages/reconciliation.dart';
import 'package:flutter_phod/pages/to_the_sick.dart';
import 'package:flutter_phod/pages/communion_to_sick.dart';
import 'package:flutter_phod/pages/time_of_death.dart';
import 'package:flutter_phod/pages/vigil.dart';
import 'package:flutter_phod/pages/prayer_list.dart';
import 'package:flutter_phod/pages/occasional_prayers.dart';
import 'package:flutter_phod/pages/canticles.dart';
import 'package:flutter_phod/pages/about.dart';
import 'package:flutter_phod/pages/contact.dart';
import 'package:flutter_phod/pages/blog.dart';
import 'package:flutter_phod/pages/wrapper.dart';
import 'package:flutter_phod/services/auth.dart';
import 'package:flutter_phod/pages/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Iphod());
}

class Iphod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      initialRoute: "/",
      routes: {
        '/': (context) => Wrapper(),
        '/calendar': (context) => Calendar(),
        '/mp': (context) => MorningPrayer(),
        '/midday': (context) => Midday(),
        '/ep': (context) => EveningPrayer(),
        '/compline': (context) => Compline(),
        '/fp': (context) => FamilyPrayers(),
        '/reconciliation': (context) => Reconciliation(),
        '/sick': (context) => ToTheSick(),
        '/comm': (context) => CommunionToSick(),
        '/tod': (context) => TimeOfDeath(),
        '/vigil': (context) => PrayerForVigil(),
        // '/pl': (context) => PrayerList(),
        '/ops': (context) => OccasionalPrayers(),
        '/cants': (context) => Canticles(),
        '/about': (context) => About(),
        // '/contact': (context) => Contact(),
        // '/blog': (context) => Blog(),
      }, // routes,
    );
  }

 /*
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          print('SOMETHING WENT WRONG WITH SNAPSHOT');
          return MorningPrayer();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider.value(
            value: AuthService().user,
            child: MaterialApp(
              theme: ThemeData(
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                })),
              initialRoute: '/', //Scaffold(
              routes: {
                '/': (context) => Wrapper(),
                '/calendar': (context) => Calendar(),
                '/mp': (context) => MorningPrayer(),
                '/midday': (context) => Midday(),
                '/ep': (context) => EveningPrayer(),
                '/compline': (context) => Compline(),
                '/fp': (context) => FamilyPrayers(),
                '/reconciliation': (context) => Reconciliation(),
                '/sick': (context) => ToTheSick(),
                '/comm': (context) => CommunionToSick(),
                '/tod': (context) => TimeOfDeath(),
                '/vigil': (context) => PrayerForVigil(),
                // '/pl': (context) => PrayerList(),
                '/ops': (context) => OccasionalPrayers(),
                '/cants': (context) => Canticles(),
                '/about': (context) => About(),
                // '/contact': (context) => Contact(),
                // '/blog': (context) => Blog(),
              }, // routes
            ),

          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }

  */
}



