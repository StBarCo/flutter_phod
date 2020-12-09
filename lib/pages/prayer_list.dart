import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class PrayerList extends StatefulWidget {
  @override
  _PrayerListState createState() => _PrayerListState();
}

class _PrayerListState extends State<PrayerList> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      context: context,
        title: 'Prayer List',
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