import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';

class PrayerForVigil extends StatefulWidget {
  @override
  _PrayerForVigilState createState() => _PrayerForVigilState();
}

class _PrayerForVigilState extends State<PrayerForVigil> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Prayers for a Vigil',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageHeader(litDay: LitDay().init()),
        ],
      ),
    );

  }
}
// TODO Implement this library.