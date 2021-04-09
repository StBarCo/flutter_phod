import 'package:flutter/material.dart';
import 'package:legereme/helpers/show_canticle.dart';
import 'package:legereme/pages/about.dart';
import 'package:legereme/pages/calendar.dart';
import 'package:legereme/pages/canticles.dart';
import 'package:legereme/pages/communion_to_sick.dart';
import 'package:legereme/pages/compline.dart';
import 'package:legereme/pages/evening_prayer.dart';
import 'package:legereme/pages/family_prayers.dart';
import 'package:legereme/pages/midday.dart';
import 'package:legereme/pages/morning_prayer.dart';
import 'package:legereme/pages/occasional_prayers.dart';
import 'package:legereme/pages/reconciliation.dart';
import 'package:legereme/pages/time_of_death.dart';
import 'package:legereme/pages/vigil.dart';
class Pages {
  String label;
  String route;
  Widget widget;

  Pages({this.label, this.route, this.widget});
  
  List<Pages> get list =>
      [ Pages( label: 'Calendar', route:  '/calendar', widget: Calendar() ),
        Pages( label: 'Morning Prayer', route:  '/mp', widget: MorningPrayer() ),
        Pages( label: 'Midday Prayer', route:  '/midday', widget: Midday() ),
        Pages( label: 'Evening Prayer', route:  '/ep', widget: EveningPrayer() ),
        Pages( label: 'Compline', route:  '/compline', widget: Compline() ),
        Pages( label: 'Family Prayers', route:  '/fp', widget: FamilyPrayers() ),
        Pages( label: 'Reconciliation', route:  '/reconciliation', widget: Reconciliation() ),
        Pages( label: 'To the Sick', route:  '/sick', widget: TodaysCanticle() ),
        Pages( label: 'Communion to the Sick', route:  '/comm', widget: CommunionToSick() ),
        Pages( label: 'Time of Death', route:  '/tod', widget: TimeOfDeath() ),
        Pages( label: 'Prayers for a Vigil', route:  '/vigil', widget: PrayerForVigil() ),
        //Pages( label: 'Prayer List', route:  '/pl' ),
        Pages( label: 'Occasional Prayers', route:  '/ops', widget: OccasionalPrayers() ),
        Pages( label: 'Canticles', route:  '/cants', widget: Canticles() ),
        Pages( label: 'About', route:  '/about', widget: About() ),
        //Pages( label: 'Blog', route:  '/blog' ),
        //Pages( label: 'Contact', route: '/contact'),
      ];
}
