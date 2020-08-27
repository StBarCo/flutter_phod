import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';

class EveningPrayer extends StatefulWidget {
  @override
  _EveningPrayerState createState() => _EveningPrayerState();
}

class _EveningPrayerState extends State<EveningPrayer> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Evening Prayer',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageHeader(litDay: LitDay().init()),
        ],
      )
    );

  }
}
